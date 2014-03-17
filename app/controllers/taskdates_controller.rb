class TaskdatesController < ApplicationController
  before_action :signed_in_user

  def show
    @taskdate = Taskdate.find(params[:id])
    @date = @taskdate.thedate.to_formatted_s(:long_ordinal)
  end

  def date
  end

  def new
    @taskdate = Taskdate.new
    3.times { @taskdate.tasks.build }
    @date = Date.today.to_formatted_s(:long_ordinal)
  end

  def create
  	@task = Taskdate.new(task_params)
    @task.user_id = current_user.id
    for tasks in @task.tasks
      @project = Project.where(id: tasks.project_id)
      tasks.project_name = @project.first.name
      tasks.customer_id = @project.first.customer_id
      @customer = Customer.where(id: tasks.customer_id)
      tasks.companyname = @customer.first.company
      tasks.user_id = current_user.id
      @task.thedate = tasks.dtstart
    end
	    if @task.save
	      flash[:success] = "Task Saved!"
	      redirect_to @task
	    else
	      render 'new'
	    end
  end

  def index
  	@taskdates = Taskdate.where(user_id: current_user.id)
    @taskdates_by_date = @taskdates.group_by(&:thedate)
    @date = params[:thedate] ? Date.parse(params[:date]) : Date.today
    @tasks = Task.where(user_id: current_user.id)
  end

  def report
    @day = Task.where(dtstart: Date.Today)
  end

  def destroy
  	Task.find(params[:id]).destroy
  	flash[:success] = "Task deleted."
  	redirect_to tasks_url
  end

  def edit
    @taskdate = Taskdate.find(params[:id])
  end

  def update
    @taskdate = Taskdate.find(params[:id])
    @tasks = @taskdate.tasks
    if @taskdate.update_attributes(task_params)
      redirect_to @taskdate, :flash => {notice: "Tasks Updated" }
    else
      render 'edit'
    end
  end

  private

	    def task_params
	      params.require(:taskdate).permit(:id,:thedate, tasks_attributes: [:id,:projectname, :companyname, :dtstart, :dtstop, :totaltime, :description, :user_id, :project_id, :customer_id, :taskdate_id,:created_at, :updated_at])
	    end
end