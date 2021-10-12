class TeamQuiz < ApplicationRecord
  include AppHelpers::Validations

  #Relationships #1. pass all relationship tests provided
  belongs_to :team
  belongs_to :quiz

  #Validations #2. pass all validation tests provided
  validates_numericality_of :raw_score, only_integer: true, allow_nil: true
  validates_numericality_of :team_points, only_integer: true, greater_than_or_equal_to: 0, allow_nil: true
  validates_inclusion_of :position, in: [1, 2, 3]
  validate -> { is_active_in_system(:team) }, on: :create
  validate -> { is_active_in_system(:quiz) }, on: :create
  validate :only_3_teams_in_quiz
  validate :team_quiz_already_existing

  #Scopes
  # 3. have the following scopes:
	# - `by_team` -- orders results alphabetically by team
	# - `by_quiz` -- orders results by round, then room number
	# - `by_position` -- orders results by position
	# - `by_team_points` -- orders results by team points in descending order
	# - `for_team` -- returns all the team-quizzes for a given team (parameter: team)
	# - `for_quiz` -- returns all the team-quizzes for a given quiz (parameter: quiz)
  scope :by_team, -> { joins(:team).order('name') }
  scope :by_quiz, -> { joins(:quiz).order('round, room') }
  scope :by_position, -> { order('position') }
  scope :by_team_points, -> { order('team_points DESC') }
  scope :for_team, ->(team) { where(team_id: team.id) }
  scope :for_quiz, ->(quiz) { where(quiz_id: quiz.id) }

  private
  def only_3_teams_in_quiz
    return false if self.quiz.nil? || self.team.nil?
    if position_changed?
      positions  =  TeamQuiz.for_quiz(self.quiz).map{|tq| tq.position}
      if positions.include?(self.position)
        errors.add(:quiz, "already has this position")
      end
    end
  end

  def team_quiz_already_existing
    return false if self.quiz.nil? || self.team.nil?
    if team_id_changed? || quiz_id_changed?
      assignment = TeamQuiz.for_team(self.team).for_quiz(self.quiz)
      errors.add(:team_quiz," already exists") if !assignment.empty?
    end
  end
  
end
