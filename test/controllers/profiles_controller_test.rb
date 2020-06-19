require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: { birthday: @profile.birthday, family_name: @profile.family_name, family_name_kana: @profile.family_name_kana, first_name: @profile.first_name, first_name_kana: @profile.first_name_kana, image: @profile.image, introduction: @profile.introduction, user_id: @profile.user_id } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { birthday: @profile.birthday, family_name: @profile.family_name, family_name_kana: @profile.family_name_kana, first_name: @profile.first_name, first_name_kana: @profile.first_name_kana, image: @profile.image, introduction: @profile.introduction, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
