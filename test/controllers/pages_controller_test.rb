# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should GET #show response json. params have name text and id' do
    post '/api/stories?title=titletitle&text=texttext'
    get '/api/stories/1/pages/1'
    res = JSON.parse(@response.body).with_indifferent_access
    assert_equal res[:name], 'titletitle'
    assert_equal res[:id], 1
  end
  test 'should POST #next response only id' do
    # create first story and page
    post '/api/stories?title=titletitle&text=texttext'
    # create next page
    post '/api/stories/1/pages/1/next?title=titletitle2&text=texttext2'
    res = JSON.parse(@response.body).with_indifferent_access
    assert_equal res[:id], 2
  end
end
