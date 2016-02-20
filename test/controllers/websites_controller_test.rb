require 'test_helper'

class WebsitesControllerTest < ActionController::TestCase
  setup do
    @website = websites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:websites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create website" do
    assert_difference('Website.count') do
      post :create, website: { discounted_price_tag: @website.discounted_price_tag, link: @website.link, logo: @website.logo, name: @website.name, product_description_tag: @website.product_description_tag, product_image_tag: @website.product_image_tag, regular_price_tag: @website.regular_price_tag, status: @website.status }
    end

    assert_redirected_to website_path(assigns(:website))
  end

  test "should show website" do
    get :show, id: @website
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @website
    assert_response :success
  end

  test "should update website" do
    patch :update, id: @website, website: { discounted_price_tag: @website.discounted_price_tag, link: @website.link, logo: @website.logo, name: @website.name, product_description_tag: @website.product_description_tag, product_image_tag: @website.product_image_tag, regular_price_tag: @website.regular_price_tag, status: @website.status }
    assert_redirected_to website_path(assigns(:website))
  end

  test "should destroy website" do
    assert_difference('Website.count', -1) do
      delete :destroy, id: @website
    end

    assert_redirected_to websites_path
  end
end
