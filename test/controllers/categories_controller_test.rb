require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get idex" do
    get categories_idex_url
    assert_response :success
  end

  test "should get show" do
    get categories_show_url
    assert_response :success
  end
end
