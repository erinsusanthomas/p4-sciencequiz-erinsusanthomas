class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
    @active_junior_teams = Team.active.juniors.alphabetical.paginate(page: params[:page]).per_page(10)
    @active_senior_teams = Team.active.seniors.alphabetical.paginate(page: params[:page]).per_page(10)
    @inactive_teams = Team.inactive.alphabetical
  end

  def show
    @current_student_assignments = @team.student_teams.current.by_position
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = "Successfully created #{@team.name} team."
      redirect_to team_path(@team) 
    else
      render action: 'new'
    end      
  end

  def update
    if @team.update_attributes(team_params)
      redirect_to team_path(@team), notice: "Updated all information for #{@team.name}" 
    else
      render :action => "edit"
    end
  end

  def destroy
    @team.destroy
    redirect_to teams_path, notice: "Removed #{@team.name} from the system."
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :organization_id, :division, :active, :coach_id)
  end

end
