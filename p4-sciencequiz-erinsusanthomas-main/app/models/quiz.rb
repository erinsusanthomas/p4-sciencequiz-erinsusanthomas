class Quiz < ApplicationRecord
  include AppHelpers::Validations

  #Relationships #1. pass all relationship tests provided
  belongs_to :event
  has_many :student_quizzes
  has_many :students, through: :student_quizzes
  has_many :team_quizzes
  has_many :teams, through: :team_quizzes

  #Validations #2. pass all validation tests provided
  validates_presence_of :event_id, :division, :room, :round
  validates_numericality_of :room, only_integer: true, greater_than: 0
  validates_numericality_of :round, only_integer: true, greater_than: 0
  validates_inclusion_of :division, in: %w( senior junior)
  validate -> { is_active_in_system(:event) }, on: :create

  #Scopes
  # 3. have the following scopes:
	# - `by_room` -- orders results by room number
	# - `by_round` -- orders results by round number
	# - `for_room` -- returns only quizzes for a given room (parameter: room)
	# - `for_round` -- returns only quizzes for a given round (parameter: round)
	# - `seniors` -- returns only quizzes for the senior division
	# - `juniors` -- returns only quizzes for the junior division
	# - `for_event` -- returns all the quizzes for a given event (parameter: event)
  scope :by_room, -> { order('room') }
  scope :by_round, -> { order('round') }
  scope :for_room, ->(room) { where(room: room) }
  scope :for_round, ->(round) { where(round: round) }
  scope :seniors, -> { where(division: "senior") }
  scope :juniors, -> { where(division: "junior") } 
  scope :for_event, ->(event) { where(event_id: event.id) }

end
