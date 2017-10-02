require 'test_helper'

class PasslostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passlost = passlosts(:one)
  end

  test "should get index" do
    get passlosts_url
    assert_response :success
  end

  test "should get new" do
    get new_passlost_url
    assert_response :success
  end

  test "should create passlost" do
    assert_difference('Passlost.count') do
      post passlosts_url, params: { passlost: { carrierFrequency: @passlost.carrierFrequency, rxAntennaHeight: @passlost.rxAntennaHeight, trSeparation: @passlost.trSeparation, txAntennaHeight: @passlost.txAntennaHeight, user_id: @passlost.user_id } }
    end

    assert_redirected_to passlost_url(Passlost.last)
  end

  test "should show passlost" do
    get passlost_url(@passlost)
    assert_response :success
  end

  test "should get edit" do
    get edit_passlost_url(@passlost)
    assert_response :success
  end

  test "should update passlost" do
    patch passlost_url(@passlost), params: { passlost: { carrierFrequency: @passlost.carrierFrequency, rxAntennaHeight: @passlost.rxAntennaHeight, trSeparation: @passlost.trSeparation, txAntennaHeight: @passlost.txAntennaHeight, user_id: @passlost.user_id } }
    assert_redirected_to passlost_url(@passlost)
  end

  test "should destroy passlost" do
    assert_difference('Passlost.count', -1) do
      delete passlost_url(@passlost)
    end

    assert_redirected_to passlosts_url
  end
end
