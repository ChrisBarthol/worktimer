class TasksController < ApplicationController

  def index
    @tasks = Task.order(:totaltime)
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.to_csv }
    end
  end

 
end