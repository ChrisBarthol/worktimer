class ProjectsController < ApplicationController
  before_action :signed_in_user
  before_action :admin_user,     only: :destroy
  require 'csv'

  def show
    @project = Project.find(params[:id])
    @customer = Customer.where(id: @project.id)
    @task = Task.where(project_id: @project.id)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
      if @project.save
        flash[:success] = "Added a New Project!"
        redirect_to @project
      else
        render 'new'
      end
  end

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted."
    redirect_to projects_url
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
      if @project.update_attributes(project_params)
        flash[:success] = "Project updated"
        redirect_to @project
      else
        render 'edit'
      end
  end

  private

      def project_params
        params.require(:project).permit(:name, :description, :customer_id)
      end
end