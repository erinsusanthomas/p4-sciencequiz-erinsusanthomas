class User < ApplicationRecord
  include AppHelpers::Deletions

  #Password #8. have a secure password
  has_secure_password

  #Relationships #1. pass all relationship tests provided
  belongs_to :organization
  has_many :teams,  :class_name => 'Team', :foreign_key => 'coach_id'

  #Validations #2. pass all validation tests provided
  validates_presence_of :organization_id, :last_name, :first_name
  validates_presence_of :status, :email, :password_digest #from data dictionary

  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"
  validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_presence_of :password, :on => :create 
  validates_presence_of :password_confirmation, :on => :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, :minimum => 4, message: "must be at least 4 characters long" 
  
  validates_inclusion_of :status, in: %w( admin leader coach ), message: "is not recognized in the system"

  #Scopes
  # 3. have the following scopes:
  #   - `active` -- returns only active users
  #   - `inactive` -- returns only inactive users
  #   - `alphabetical` -- orders results alphabetically by user's last, first names
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('last_name, first_name') }

  #Methods
  # 4.	have a method called `make_active` which changes the status from inactive to active and 
  #saves the change in the database
  # Method to change status from inactive to active and saves the change in the database
  def make_active
    self.active = true
    self.save!
  end
  
  # 5. have a method called `make_inactive` which changes the status from active to inactive and 
  #saves the change in the database
  # Method to change status from active to inactive and saves the change in the database
  def make_inactive
    self.active = false
    self.save!
  end  
  
  # 6. have a method called `name` which returns the student's full name as "last-name, first-name"
  def name 
    last_name + ", " + first_name
  end

  # 7. have a method called `proper_name` which returns the student's full name as "first-name last-name"
  def proper_name
    first_name + " " + last_name
  end

  # 9. have a method called `role?` which returns true if the user's status 
  #matches the role in question (e.g., `:admin`)
  ROLES = [['Admin', :admin],['Leader', :leader],['Coach', :coach]]
  def role?(authorized_status)
    return false if status.nil?
    status.downcase.to_sym == authorized_status
  end

  # 10. have a class method called `authenticate` which takes a username and password 
  #and attempts to authenticate the user based on the password digest saved for that user in the system
  def self.authenticate(username, password)
    find_by_username(username).try(:authenticate, password)
  end
  

  #Callbacks
  # 12. cannot be destroyed for any reason
  before_destroy do 
    cannot_destroy_object()
  end

  # 11. save phone numbers in the database as a string consisting only of digits
  before_save :reformat_phone
  private
    # We need to strip non-digits before saving to db
    def reformat_phone
      phone = self.phone.to_s  # change to string in case input as all numbers 
      phone.gsub!(/[^0-9]/,"") # strip all non-digits
      self.phone = phone       # reset self.phone to new string
    end

end
