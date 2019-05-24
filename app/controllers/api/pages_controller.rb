# frozen_string_literal: true

module Api
  class PagesController < ApplicationController
    def show
      page = Page.find_by!(id: params[:id], story_id: params[:story_id])
      children = page.children.map { |child| child.slice(:id, :name) }
      res = page.slice(:id, :name, :text)
      res.store('children', children)
      render json: res
    end

    def next
      page = Page.create(
        name: params[:name],
        text: params[:text],
        story_id: params[:story_id],
        parent_id: params[:page_id]
      )
      render json: page
    end
  end
end
