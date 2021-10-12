class Event < ApplicationRecord
  include AppHelpers::Validations

  #Relationships #1. pass all relationship tests provided
  belongs_to :organization
  has_many :quizzes

  #Validations #2. pass all validation tests provided
  validates_presence_of :organization_id
  validates_presence_of :date #from data dictionary

  validates_date :date, message: "invalid entry for date"
  validate -> { is_active_in_system(:organization) }, on: :create

  #Scopes
  # 3. have the following scopes:
	# - `active` -- returns only active events
	# - `inactive` -- returns only inactive events
	# - `chronological` -- orders results chronologically by date
	# - `past` -- returns only events happened in the past
	# - `upcoming` -- returns only events that are today or in the future
	# - `for_organization` -- returns all the events for a given organization (parameter: organization)
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :chronological, -> { order('date') }
  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }
  scope :for_organization, ->(organization) { where(organization_id: organization.id) }

  #Methods
  # 4.	have a method called `make_active` which changes the status from inactive to active 
  # and saves the change in the database
  # Method to change status from inactive to active and saves the change in the database
  def make_active
    self.active = true
    self.save!
  end
  
  # 5. have a method called `make_inactive` which changes the status from active to inactive 
  # and saves the change in the database
  # Method to change status from active to inactive and saves the change in the database
  def make_inactive
    self.active = false
    self.save!
  end 

end
