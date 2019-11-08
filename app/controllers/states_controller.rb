class StatesController < ApplicationController
  before_action :authenticate_user!

  def create
    @task = Task.find(params[:task_id])
    @state = State.new(task: @task, user: current_user)

    if @state.save
      redirect_to root_path, notice: 'La tarea ha sido completada'
    else
      redirect_to root_path, alert: 'La tarea no ha podido ser completada'
    end
  end



end
