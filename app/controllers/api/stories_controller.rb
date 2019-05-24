# frozen_string_literal: true

module Api
  class StoriesController < ApplicationController
    def index
      render json: Story.all.map { |story|
        page_root = story.pages.find_by(parent_id: nil)
        story_hash = story.slice(:id, :title)
        story_hash.store('parentId', page_root&.id)
        story_hash
      }
    end

    def create
      text = params[:text]
      title = params[:title]
      summary = text.slice(0, 10)
      story = Story.create(title: title, summary: summary)
      page = Page.create(name: title, text: text, story_id: story.id)
      render json: { storyId: story.id, pageId: page.id }
    end
  end
end
