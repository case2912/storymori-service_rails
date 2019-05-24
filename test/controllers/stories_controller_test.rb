# frozen_string_literal: true

require 'test_helper'

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should GET show #index' do
    get '/api/stories'
    assert_equal @response.status, 200
  end
  test 'should have params:[ #index response' do
    story = Story.new
    story.title = 'たいとる'
    story.summary = 'てきすと'
    story.save
    get '/api/stories'
    res = JSON.parse(@response.body)
    assert_equal res[0]['parentId'], nil
    assert_equal res[0]['title'], 'たいとる'
    assert_equal res[0]['summary'], 'てきすと'
  end
  test 'should POST #create return json params:pageId, storyId' do
    count = Story.all.count
    post '/api/stories?title="title"&text="text"'
    res = JSON.parse(@response.body)
    assert res['storyId'].is_a? Integer
    assert res['pageId'].is_a? Integer
    assert_equal count + 1, Story.all.count
  end
  test 'should POST #create create Story' do
    post '/api/stories?title=titletitle&text=texttext'
    res = JSON.parse(@response.body)
    assert_equal Story.find(res['storyId']).summary, 'texttext'.slice(0, 10)
    assert_equal Story.find(res['storyId']).title, 'titletitle'
    assert_equal Page.find(res['pageId']).text, 'texttext'
  end
end
