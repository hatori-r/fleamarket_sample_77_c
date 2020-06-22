require 'test_helper'

class SendAdressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @send_adress = send_adresses(:one)
  end

  test "should get index" do
    get send_adresses_url
    assert_response :success
  end

  test "should get new" do
    get new_send_adress_url
    assert_response :success
  end

  test "should create send_adress" do
    assert_difference('SendAdress.count') do
      post send_adresses_url, params: { send_adress: { address: @send_adress.address, apartment: @send_adress.apartment, city: @send_adress.city, post_number: @send_adress.post_number, prefectures: @send_adress.prefectures, send_family_kana: @send_adress.send_family_kana, send_family_name: @send_adress.send_family_name, send_first_kana: @send_adress.send_first_kana, send_first_name: @send_adress.send_first_name, sendscol: @send_adress.sendscol, tell_number: @send_adress.tell_number, user_id: @send_adress.user_id } }
    end

    assert_redirected_to send_adress_url(SendAdress.last)
  end

  test "should show send_adress" do
    get send_adress_url(@send_adress)
    assert_response :success
  end

  test "should get edit" do
    get edit_send_adress_url(@send_adress)
    assert_response :success
  end

  test "should update send_adress" do
    patch send_adress_url(@send_adress), params: { send_adress: { address: @send_adress.address, apartment: @send_adress.apartment, city: @send_adress.city, post_number: @send_adress.post_number, prefectures: @send_adress.prefectures, send_family_kana: @send_adress.send_family_kana, send_family_name: @send_adress.send_family_name, send_first_kana: @send_adress.send_first_kana, send_first_name: @send_adress.send_first_name, sendscol: @send_adress.sendscol, tell_number: @send_adress.tell_number, user_id: @send_adress.user_id } }
    assert_redirected_to send_adress_url(@send_adress)
  end

  test "should destroy send_adress" do
    assert_difference('SendAdress.count', -1) do
      delete send_adress_url(@send_adress)
    end

    assert_redirected_to send_adresses_url
  end
end
