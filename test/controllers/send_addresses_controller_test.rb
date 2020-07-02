require 'test_helper'

class SendAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_address = send_addresses(:one)
  end

  test "should get index" do
    get send_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_send_address_url
    assert_response :success
  end

  test "should create send_address" do
    assert_difference('SendAddress.count') do
      post send_addresses_url, params: { send_address: { address: @send_address.address, apartment: @send_address.apartment, city: @send_address.city, post_number: @send_address.post_number, prefectures_id: @send_address.prefectures_id, send_family_kana: @send_address.send_family_kana, send_family_name: @send_address.send_family_name, send_first_kana: @send_address.send_first_kana, send_first_name: @send_address.send_first_name, sendscol: @send_address.sendscol, tell_number: @send_address.tell_number, user_id: @send_address.user_id } }
    end

    assert_redirected_to send_address_url(SendAddress.last)
  end

  test "should show send_address" do
    get send_address_url(@send_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_address_url(@send_address)
    assert_response :success
  end

  test "should update send_address" do
    patch send_address_url(@send_address), params: { send_address: { address: @send_address.address, apartment: @send_address.apartment, city: @send_address.city, post_number: @send_address.post_number, prefectures_id: @send_address.prefectures_id, send_family_kana: @send_address.send_family_kana, send_family_name: @send_address.send_family_name, send_first_kana: @send_address.send_first_kana, send_first_name: @send_address.send_first_name, sendscol: @send_address.sendscol, tell_number: @send_address.tell_number, user_id: @send_address.user_id } }
    assert_redirected_to send_address_url(@send_address)
  end

  test "should destroy send_address" do
    assert_difference('SendAddress.count', -1) do
      delete send_address_url(@send_address)
    end

    assert_redirected_to send_addresses_url
  end
end
