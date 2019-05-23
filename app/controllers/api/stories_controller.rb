module Api
  class StoriesController < ApplicationController
    def index
      render json: {id:1}
    end
    def create
      summary = params[:text].slice(0,10)
      Story.create(title:params[:title], summary:summary)
      render json: {id:1}
    end
  end
end

