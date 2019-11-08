class StatesController < ApplicationController
  before_action :set_params
  before_action :authenticate_user!

  def create
    @user = current_user
    @state = State.new(user:current_user, task: @task, completed: true)
    # @state = State.new(user: current_user, task: @task, completed: true)
  # task.completed = true

    if @state.save
      redirect_to root_path, notice: 'La tarea ha sido completada'
    else
      redirect_to root_path, alert: 'La tarea no ha podido ser completada'
    end
  end

  def destroy
    @state = State.find_by(user_id: current_user, task_id: @task)
    @state.destroy
    redirect_to root_path

  end

  private
  def set_params
    @task = Task.find(params[:task_id])
  end



end
