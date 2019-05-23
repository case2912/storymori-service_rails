module Api
  class PagesController < ApplicationController
    def show
      page = Page.where(story_id:params[:story_id]).find(params[:id])
      children = Page.where(story_id:params[:story_id]).where(parent_id:params[:id])
      @json = page.attributes
      @json.store('children', children)
      render json: @json
    end
    def next
      story_id = params[:story_id]
      parent_id = params[:page_id]
      text = params[:text]
      name = params[:name]
      page = Page.create(name:name, text:text, story_id:story_id,parent_id:parent_id)
      render json: page
    end
  end
end

