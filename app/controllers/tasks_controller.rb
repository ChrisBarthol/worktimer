class TasksController < ApplicationController

  def index
    @tasks = Task.order(:totaltime)
    @day = Task.where(dtstart: Time.now-1.days..Time.now)
    @week = Task.where(dtstart: Time.now-7.days..Time.now)
    @month = Task.where(dtstart: Time.now-30.days..Time.now)
    @day_by_time = @day.group_by(&:id)
    @week_by_time = @week.group_by(&:id)
    @month_by_time = @month.sum('totaltime')
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
    end
  end

 def destroy
  	Task.find(params[:id]).destroy
  	flash[:success] = "Task deleted."
  	redirect_to taskdates_url
  end
end