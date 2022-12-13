require "test_helper"

class AutomorphicControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get automorphic_input_url
    assert_response :success
  end

  test "should get output" do
    get automorphic_output_url
    assert_response :success
  end
end
