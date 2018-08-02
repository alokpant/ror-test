class PagesController < ApplicationController
  def index
    if(params[:filter] == nil)
      @active_filter = 'all'
      @tasks = Task.all
    else
      @tasks = Task.where(nil)
      @active_filter = params[:filter]

      if params[:filter] == 'are_done'
        @tasks = @tasks.are_done(true)
      else
        if params[:filter] == 'are_undone'
          @tasks = @tasks.are_done(false)
        end
      end
    end
  end
end
