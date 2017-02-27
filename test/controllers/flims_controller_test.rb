require 'test_helper'

class FlimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flim = flims(:Laar)
  end

  test "should get index" do

    get flims_url, as: :json

    assert_response :success

    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body

    # ensure getting the complete data set
    assert_equal 6, jdata['data'].length

    # ensure we are getting the right data
    assert_equal jdata['data'][0]['type'], 'flims'
  end

  test "should create flim" do
    assert_difference('Flim.count') do
      post flims_url, params: { flim: { description: @flim.description, title: @flim.title, url_slug: @flim.url_slug, year: @flim.year } }, as: :json
    end

    assert_response 201
  end

  test "should show flim" do
    get flim_url(@flim), as: :json
    assert_response :success
  end

  test "should update flim" do
    patch flim_url(@flim), params: { flim: { description: @flim.description, title: @flim.title, url_slug: @flim.url_slug, year: @flim.year } }, as: :json
    assert_response 200
  end

  test "should update flim with a rating" do
    patch flim_url(@flim), params: { flim: { description: @flim.description, title: @flim.title, url_slug: @flim.url_slug, year: @flim.year }, rating: 4 }, as: :json
    assert_response 200
  end

  test "should destroy flim" do
    assert_difference('Flim.count', -1) do
      delete flim_url(@flim), as: :json
    end

    assert_response 204
  end

  test "it should get a sorted flim list in ascending order" do

    flim = Flim.order('url_slug ASC').first

    
    # note: There is a bug in minitest for this test
    # see issue here in Github
    # https://github.com/rails/rails/issues/26033

    
    #get flims_url, params: { sort: 'url_slug' }, as: :json
    #get flims_url, as: :json
# 
    #assert_response :success
#
    #jdata = JSON.parse response.body
#
    #assert_equal flim.url_slug, jdata['data'][0]['attributes']['url_slug']
  end

  test "it should get a sorted flim list in descending order" do

    flim = Flim.order('url_slug DESC').first

    # note: There is a bug in minitest for this test
    # see issue here in Github
    # https://github.com/rails/rails/issues/26033


    #get :index, params: { sort: '-url_slug' }
    #get flims_url, params: { sort: '-url_slug' }, as: :json
#
    #assert_response :success
    #jdata = JSON.parse response.body
#
    #assert_equal flim.url_slug, jdata['data'][0]['attributes']['url_slug']
  end

end
