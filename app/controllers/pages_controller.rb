class PagesController < ApplicationController
  def index
    @task = Task.new
    @there_are_done_items = Task.find_by(:is_done => true)

    if(params[:editing_task] != nil)
      @editing_task = Task.find_by(:id => params[:editing_task])
    end

    if(params[:filter] == nil)
      @active_filter = 'all'
      @visible_tasks = Task.all
    else
      @visible_tasks = Task.where(nil)
      @active_filter = params[:filter]

      if params[:filter] == 'are_done'
        @visible_tasks = @visible_tasks.are_done(true)
      elsif params[:filter] == 'are_undone'
        @visible_tasks = @visible_tasks.are_done(false)
      end
    end
  end
end
