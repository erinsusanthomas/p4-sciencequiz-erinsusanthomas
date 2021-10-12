class Student < ApplicationRecord
  include AppHelpers::Deletions
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  include AppHelpers::Validations

  # Relationships
  belongs_to :organization
  has_many :student_teams
  has_many :teams, through: :student_teams
  has_many :student_quizzes
  has_many :quizzes, through: :student_quizzes

  # Scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :juniors, -> { where('grade < 7') }
  scope :seniors, -> { where('grade > 6') }
  scope :for_organization, ->(organization) { where(organization_id: organization.id) }

  # Validations
  validates_presence_of :first_name, :last_name, :grade, :organization_id
  validates_numericality_of :grade, greater_than: 2, less_than: 13, only_integer: true
  validate -> { is_active_in_system(:organization) }, on: :create

  # Methods
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end

  def junior?
    grade < 7
  end

  def current_team
    curr_team = self.student_teams.current    
    return nil if curr_team.empty?
    curr_team.first.team   # return as a single object, not an array
  end

  #Callbacks
  before_destroy do 
    if self.student_quizzes.empty?
      self.student_teams.each do |st| 
        st.destroy if st.team = self.current_team
      end
    else
      cannot_destroy_object()
    end
  end

  after_rollback :make_student_inactive
  after_update :when_made_inactive_terminate, on: :make_inactive

  private
  def make_student_inactive
    return true unless self.destroyable == false
    self.make_inactive
    self.student_teams.each do |st| 
      st.terminate_now if st.team = self.current_team 
    end 
    msg = "This #{self.class.to_s.downcase} cannot be deleted but was made inactive instead."
    errors.add(:base, msg)
  end
  def when_made_inactive_terminate
    self.student_teams.each do |st| 
      st.terminate_now if st.team = self.current_team
    end 
  end
end
