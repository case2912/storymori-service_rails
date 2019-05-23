module Api
  class PagesController < ApplicationController
    def show
      page = Page.where(story_id:params[:story_id]).find(params[:id])
      render json: page
    end
    def next
    end
  end
end

