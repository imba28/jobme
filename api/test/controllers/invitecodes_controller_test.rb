require 'test_helper'

class InvitecodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invitecode = invitecodes(:one)
  end

  test "should get index" do
    get invitecodes_url
    assert_response :success
  end

  test "should get new" do
    get new_invitecode_url
    assert_response :success
  end

  test "should create invitecode" do
    assert_difference('Invitecode.count') do
      post invitecodes_url, params: { invitecode: { code: @invitecode.code, group_id: @invitecode.group_id } }
    end

    assert_redirected_to invitecode_url(Invitecode.last)
  end

  test "should show invitecode" do
    get invitecode_url(@invitecode)
    assert_response :success
  end

  test "should get edit" do
    get edit_invitecode_url(@invitecode)
    assert_response :success
  end

  test "should update invitecode" do
    patch invitecode_url(@invitecode), params: { invitecode: { code: @invitecode.code, group_id: @invitecode.group_id } }
    assert_redirected_to invitecode_url(@invitecode)
  end

  test "should destroy invitecode" do
    assert_difference('Invitecode.count', -1) do
      delete invitecode_url(@invitecode)
    end

    assert_redirected_to invitecodes_url
  end
end
