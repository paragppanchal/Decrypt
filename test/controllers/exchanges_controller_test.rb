require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get exchanges_index_url
    assert_response :success
  end

  test "should get show" do
    get exchanges_show_url
    assert_response :success
  end

end
