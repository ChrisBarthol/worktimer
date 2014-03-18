class TasksController < ApplicationController
	before_action :signed_in_user
  before_action :admin_user,     only: :index

  def index
    @tasks = Task.order(:totaltime)
    @day = Task.where(dtstart: Time.now-1.days..Time.now)  #tasks today
    @week = Task.where(dtstart: Time.now-7.days..Time.now) #tasks this week
    @month = Task.where(dtstart: Time.now-30.days..Time.now)  #tasks this month
    @day_by_time = @day.group_by(&:id)
    @week_by_time = @week.group_by(&:id)
    @month_by_time = @month.sum('totaltime')
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }   #export to CSV
    end
  end

 def destroy
  	Task.find(params[:id]).destroy
  	flash[:success] = "Task deleted."
  	redirect_to taskdates_url
  end
end