class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @active_organizations = Organization.active.alphabetical.paginate(page: params[:page]).per_page(10)
    @inactive_organizations = Organization.inactive.alphabetical
  end

  def show
    # @current_junior_students = @organization.students.juniors.alphabetical.active
    # @current_senior_students = @organization.students.seniors.alphabetical.active
    # @current_junior_teams    = @organization.teams.juniors.alphabetical.active
    # @current_senior_teams    = @organization.teams.seniors.alphabetical.active
    @current_teams           = @organization.teams.active.by_division.alphabetical
    @current_students        = @organization.students.active.alphabetical
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      flash[:notice] = "Successfully created #{@organization.name}."
      redirect_to organization_path(@organization) 
    else
      render action: 'new'
    end      
  end

  def update
    if @organization.update_attributes(organization_params)
      redirect_to organization_path(@organization), notice: "Updated all information for #{@organization.short_name}" 
    else
      render :action => "edit"
    end
  end

  def destroy
    @organization.destroy
    redirect_to organizations_path, notice: "Removed #{@organization.name} from the system."
  end

  private
  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :street_1, :street_2, :city, :state, :zip, :short_name, :active)
  end

end
