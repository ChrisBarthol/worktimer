class ProjectsController < ApplicationController
  require 'csv'

  def show
    @project = Project.find(params[:id])
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

  private

      def project_params
        params.require(:project).permit(:name, :description, :customer_id)
      end
end