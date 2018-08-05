class TasksController < ApplicationController
  layout :resolve_layout

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find_by(id: params[:id])
  end

  def edit
    @submit_url = task_path
    @task = Task.find_by(id: params[:id])
  end

  def new
    @submit_url = tasks_path
    @task = Task.new
  end

  def create
    @task = Task.new(post_params)
    @task.save
    redirect_back fallback_location: 'pages#index'
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(post_params)
      if /\A?editing_task=[^&]+&*/.match request.referrer
        redirect_to request.referrer.sub(/\A?editing_task=[^&]+&*/, '')
      else
        redirect_back fallback_location: 'pages#index'
      end
    else
      render 'edit'
    end
  end

  def clear_completed
    Task.where(:is_done => true).each do |task|
      task.destroy
    end

    redirect_back fallback_location: 'pages#index'
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    @task.destroy
    redirect_back fallback_location: 'pages#index'
  end

  def mark_as_done
    @task = Task.find_by(id: params[:id])

    @task.is_done = true
    if @task.save
      redirect_back fallback_location: 'pages#index'
    else
      render 'edit'
    end
  end

  def mark_as_undone
    @task = Task.find_by(id: params[:id])

    @task.is_done = false
    if @task.save
      redirect_back fallback_location: 'pages#index'
    else
      render 'edit'
    end
  end

  private def post_params
    params.require(:task).permit(:description, :is_done, :id)
  end
end
