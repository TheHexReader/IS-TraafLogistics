require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'show index' do
    get root_path

    assert_response :success
    assert_select 'div#home-index'
  end
end
