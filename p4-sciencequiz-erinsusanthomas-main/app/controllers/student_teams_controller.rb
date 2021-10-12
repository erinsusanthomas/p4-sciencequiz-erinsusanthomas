class StudentTeamsController < ApplicationController
  
  def new
    @student_team = StudentTeam.new
    unless params[:team_id].nil?
      @team = Team.find(params[:team_id]) 
      @current_students = @team.student_teams.current.map{|st| st.student }
    end
    unless params[:student_id].nil?
      @student = Student.find(params[:student_id]) 
      @current_team = @student.current_team
    end
  end
  
  def create
    @student_team = StudentTeam.new(student_team_params)
    @student_team.start_date = Date.current
    if @student_team.save
      flash[:notice] = "Successfully added the student team assignment."
      redirect_to team_path(@student_team.team)
    else
      @team = Team.find(params[:student_team][:team_id])
      render action: 'new', locals: { team: @team }
    end
  end

  def terminate
    @student_team = StudentTeam.find(params[:id])
    @student_team.terminate_now
    flash[:notice] = "Team assignment terminated as of today."
    redirect_to team_path(@student_team.team)
  end

  def destroy
    @student_team = StudentTeam.find(params[:id])
    @student_team.destroy
    flash[:notice] = "Successfully destroyed team assignment."
    redirect_to team_path(@student_team.team)
  end

  private
  def student_team_params
    params.require(:student_team).permit(:student_id, :team_id, :start_date, :position)
  end
end
