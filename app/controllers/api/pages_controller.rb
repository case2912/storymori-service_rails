module Api
  class PagesController < ApplicationController
    def show
      pages = Story.find(params[:story_id]).pages
      page = pages.find(params[:id])
      children = pages.where(parent_id:params[:id])
      res = page.attributes
      res.store('children', children)
      render json: res
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

