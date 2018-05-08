require 'test_helper'

class MatchingControllerTest < ActionDispatch::IntegrationTest
  test 'should get match' do
    get matching_match_url
    assert_response :success
  end
end
