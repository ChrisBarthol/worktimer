class TaskdatesController < ApplicationController

  def show
    @taskdate = Taskdate.find(params[:id])
    @date = @taskdate.thedate.to_formatted_s(:long_ordinal)
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
  	@taskdates = Taskdate.all
    @taskdates_by_date = @taskdates.group_by(&:thedate)
    @date = params[:thedate] ? Date.parse(params[:date]) : Date.today
    
  end



  def destroy
  	Task.find(params[:id]).destroy
  	flash[:success] = "Task deleted."
  	redirect_to tasks_url
  end

  private

	    def task_params
	      params.require(:taskdate).permit(:thedate, tasks_attributes: [:projectname, :companyname, :dtstart, :dtstop, :totaltime, :description, :user_id, :project_id, :customer_id, :taskdate_id,:created_at, :updated_at])
	    end
end