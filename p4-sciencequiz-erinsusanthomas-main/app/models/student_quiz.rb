class StudentQuiz < ApplicationRecord
  #Relationships #1. pass all relationship tests provided
  belongs_to :student
  belongs_to :quiz

  #Validations #2. pass all validation tests provided
  validates_presence_of :student_id, :quiz_id, :num_correct, :num_attempted
  validates_numericality_of :num_attempted, only_integer: true, greater_than_or_equal_to: 0, less_than: 7
  validates_numericality_of :num_correct, only_integer: true, greater_than_or_equal_to: 0, less_than: 5
  validate :student_should_belong_to_team

  #Scopes
  # 3. have the following scopes:
	# - `by_student` -- orders results alphabetically by student's last, first names
	# - `by_quiz` -- orders results by round, then room number
	# - `by_score` -- orders results by score in descending order
	# - `for_student` -- returns all the student-quizzes for a given student (parameter: student)
	# - `for_quiz` -- returns all the student-quizzes for a given quiz (parameter: quiz)
  scope :by_student,  -> { joins(:student).order('last_name, first_name') }
  scope :by_quiz,  -> { joins(:quiz).order('round, room') }
  scope :by_score, -> { order('score desc') }
  scope :for_student, ->(student) { where(student_id: student.id) }
  scope :for_quiz, ->(quiz) { where(quiz_id: quiz.id) }

  #Callbacks
  # 4. have a callback that automatically converts the number of correct answers and the number of questions attempted 
  # and converts that into the appropriate student score. This should work before both updating and inserting a record.
  before_save :scores_calculated

  private
  def scores_calculated
    base_score = 20 * num_correct
    
    if num_attempted == 4 && num_correct == 4 
      bonus = 10 
    else
      bonus = 0
    end
    
    if num_attempted - num_correct > 1
      penality = 10 * (num_attempted - num_correct - 1) 
    else
      penality = 0
    end

    self.score = base_score + bonus - penality
  end

  def student_should_belong_to_team
    return false if self.student.nil? || self.quiz.nil?
    errors.add(:student, "does not have a current team") if self.student.current_team.nil?
  end

end
