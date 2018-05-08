require 'test_helper'

class ChildhoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @childhood = childhoods(:one)
  end

  test 'should get index' do
    get childhoods_url
    assert_response :success
  end

  test 'should get new' do
    get new_childhood_url
    assert_response :success
  end

  test 'should create childhood' do
    assert_difference('Childhood.count') do
      post childhoods_url, params: { childhood: {} }
    end

    assert_redirected_to childhood_url(Childhood.last)
  end

  test 'should show childhood' do
    get childhood_url(@childhood)
    assert_response :success
  end

  test 'should get edit' do
    get edit_childhood_url(@childhood)
    assert_response :success
  end

  test 'should update childhood' do
    patch childhood_url(@childhood), params: { childhood: {} }
    assert_redirected_to childhood_url(@childhood)
  end

  test 'should destroy childhood' do
    assert_difference('Childhood.count', -1) do
      delete childhood_url(@childhood)
    end

    assert_redirected_to childhoods_url
  end
end
