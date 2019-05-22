class StoriesController < ApplicationController
  def index
    render json: Story.all
  end
  def create
  end
end
