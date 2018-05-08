# frozen_string_literal: true

require 'test_helper'

class NowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @now = nows(:one)
  end

  test 'should get index' do
    get nows_url
    assert_response :success
  end

  test 'should get new' do
    get new_now_url
    assert_response :success
  end

  test 'should create now' do
    assert_difference('Now.count') do
      post nows_url, params: { now: {} }
    end

    assert_redirected_to now_url(Now.last)
  end

  test 'should show now' do
    get now_url(@now)
    assert_response :success
  end

  test 'should get edit' do
    get edit_now_url(@now)
    assert_response :success
  end

  test 'should update now' do
    patch now_url(@now), params: { now: {} }
    assert_redirected_to now_url(@now)
  end

  test 'should destroy now' do
    assert_difference('Now.count', -1) do
      delete now_url(@now)
    end

    assert_redirected_to nows_url
  end
end
