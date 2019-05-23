class StoriesController < ApplicationController
  def index
    render json: Story.all
  end
  def create
    summary = params[:text].slice(0,10)
    Story.create(title:params[:title], summary:summary)
    byebug
    render json: {}
  end
end
