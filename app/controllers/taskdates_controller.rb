class TaskdatesController < ApplicationController

  def show
    @task = Taskdate.find(params[:id])
  end

  def new
    @taskdate = Taskdate.new
    3.times { @taskdate.tasks.build }
    @date = Date.today.to_formatted_s(:long_ordinal)
  end

  def create
  	@task = Taskdate.new(task_params)
	    if @task.save
	      flash[:success] = "Task Saved!"
	      redirect_to @task
	    else
	      render 'new'
	    end
  end

  def index
  	@tasks = Task.paginate(page: params[:page])
  end



  def destroy
  	Task.find(params[:id]).destroy
  	flash[:success] = "Task deleted."
  	redirect_to tasks_url
  end

  private

	    def task_params
	      params.require(:taskdate).permit(:dtstart, :dtstop, :totaltime, :description, :user_id, :project_id, :customer_id, :taskdate_id)
	    end
end