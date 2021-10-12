class StudentTeam < ApplicationRecord
  include AppHelpers::Activeable::InstanceMethods
  extend AppHelpers::Activeable::ClassMethods
  include AppHelpers::Validations

  # Relationships
  belongs_to :student
  belongs_to :team

  # Scopes
  scope :by_position,   -> { order(:position) }
  scope :alphabetical,  -> { joins(:student).order('last_name, first_name') }
  scope :chronological, -> { order(:start_date) }
  scope :for_team,      ->(team) { where('team_id =?', team.id) }
  scope :for_student,   ->(student) { where(student: student) }
  scope :captains,      -> { where(position: 1) }
  scope :current,       -> { where('end_date IS NULL') }
  scope :past,          -> { where('end_date IS NOT NULL') }

  # Validations
  validates_presence_of :start_date, :position, :student_id, :team_id
  validates_numericality_of :position, greater_than: 0, less_than: 6, only_integer: true
  validates_date :start_date, on_or_before: ->{ Date.current }, on_or_before_message: "cannot be in the future"
  validates_date :end_date, on_or_after: :start_date, on_or_before: ->{ Date.current }, allow_blank: true
  validate -> { is_active_in_system(:student) }, on: :create
  validate -> { is_active_in_system(:team) }, on: :create
  # new custom validations
  # 1. organization of student and team should match 
  validate :organization_match
  # 2. position should be selectively given   
  validate :position_selective_in_team
  # 3. team's division and grade of student must be consistent  
  validate :division_grade_consistency
  # 4. not be able to add existing student team combo  
  validate :student_team_already_existing



  # Other methods
  def terminate_now
    current_assignment = self.student.student_teams.current.first
    if current_assignment.nil?
      return true 
    else
      current_assignment.end_date = Date.current
      current_assignment.update_attribute(:end_date, Date.current)
    end
  end

  # Callbacks
  before_create :end_previous_team_assignment

  private
  def end_previous_team_assignment
    current_assignment = self.student.student_teams.current.first
    if current_assignment.nil?
      return true 
    else
      current_assignment.update_attribute(:end_date, self.start_date.to_date)
    end
  end

  # 1. organization of student and team should match 
  def organization_match
    return false if self.student.nil? || self.team.nil?
    student_org = self.student.organization
    team_org = self.team.organization
    if student_org != team_org
      errors.add(:team, "organization does not match student's organization")
    end
  end
  
  # 2. position should be selectively given  #only_one_captain
  def position_selective_in_team
    return false if self.student.nil? || self.team.nil?
    if position_changed?
      team_positions  =  StudentTeam.current.for_team(self.team).map{|t| t.position}
      if team_positions.include?(self.position)
        errors.add(:team, "already has this position")
      end
    end
  end

  # 3. team's division and grade of student must be consistent
  def division_grade_consistency
    return false if self.student.nil? || self.team.nil?
    if self.student.junior? && self.team.junior?
      return true
    elsif !self.student.junior? && !self.team.junior? 
      return true
    else 
      errors.add(:student, "'s grade is inappropriate for this team")
    end
  end

  # 4. not be able to add existing student team combo
  def student_team_already_existing
    return false if self.student.nil? || self.team.nil?
    if student_id_changed? || team_id_changed?
      assignment = StudentTeam.for_team(self.team).for_student(self.student)
      errors.add(:student_team,"assignment already exists") if !assignment.empty?
    end
  end

end
