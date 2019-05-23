module Api
  class StoriesController < ApplicationController
    def index
      render json: Story.all
    end
    def create
      text = params[:text]
      title = params[:title]
      summary = text.slice(0,10)
      story = Story.create(title:title, summary:summary)
      page = Page.create(name:title, text:text, story_id:story.id)
      render json: {storyId:story.id, pageId:page.id}
    end
  end
end

