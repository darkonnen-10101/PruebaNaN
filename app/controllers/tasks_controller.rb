class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @states = State.where(completed: true)
    @state = @states.uniq{|x| x.user_id}
    @users = []
    @state.each do |i|
     @users << User.find_by(id: i.user.id).email
    end

  end

  def show
    @state = State.where(completed: true, task_id: params[:id])
    @states = State.limit(5).where(completed: true, task_id: params[:id])
    @user = User.all.order('created_at DESC')
    @users = []
    @user.each do |u|
      @users << u.email
    end

    @cont = 0

  end




end
