require 'test_helper'

class FlimsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flim = flims(:one)
  end

  test "should get index" do
    get flims_url, as: :json
    assert_response :success
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

  test "should destroy flim" do
    assert_difference('Flim.count', -1) do
      delete flim_url(@flim), as: :json
    end

    assert_response 204
  end
end
