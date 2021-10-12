class Team < ApplicationRecord
  include AppHelpers::Deletions
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  include AppHelpers::Validations

  DIVISION_LIST = [['Junior', 'junior'],['Senior', 'senior']].freeze

  # Relationships
  belongs_to :organization
  belongs_to :coach, class_name: "User"
  has_many :student_teams
  has_many :students, through: :student_teams
  has_many :team_quizzes
  has_many :quizzes, through: :team_quizzes

  # Scopes
  scope :alphabetical, -> { order(:name) }
  scope :by_division, -> { order(:division) }
  scope :for_organization, ->(organization) { where(organization_id: organization.id) }
  scope :juniors, -> { where(division: 'junior') }
  scope :seniors, -> { where(division: 'senior') }

  # Validations
  validates_presence_of :name, :division, :organization_id
  validates_inclusion_of :division, in: %w[senior junior], message: 'is not a valid division'
  validate -> { is_active_in_system(:organization) }, on: :create

  # Other methods
  def junior?
    self.division == 'junior'
  end

  #Callbacks
  before_destroy do 
    if !self.team_quizzes.empty?
      cannot_destroy_object()
    end
  end

end
