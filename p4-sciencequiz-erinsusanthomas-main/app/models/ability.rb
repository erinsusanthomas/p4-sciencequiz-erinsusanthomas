# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :admin
      can :manage, :all
    elsif user.role? :leader
      can :read, :all
      can :create, User
      can :create, Team
      can :create, StudentTeam
      can :modify, Organization do |organization|  
        organization.id == user.organization_id
      end
      can :modify, User do |u|  
        u.organization_id == user.organization_id
      end
      can :modify, Team do |team|  
        team.organization_id == user.organization_id
      end
      can :modify, StudentTeam do |student_team|  
        student_team.team.organization_id == user.organization_id
      end
    elsif user.role? :coach
      can :index, Team
      can :index, Student
      can :index, Organization
      can :show, Organization do |organization|  
        organization.id == user.organization_id
      end
      can :index, Event
      can :show, Event
      can :index, Quiz
      can :show, Quiz
      can :show, Student do |student|
        student.organization_id == user.organization_id
      end
      can :modify, Student do |student|
        student.organization_id == user.organization_id if student.active?
      end
      can :update, StudentTeam do |student_team|  
        student_team.team.organization_id == user.organization_id
      end
    end
  end
end
