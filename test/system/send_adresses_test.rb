require "application_system_test_case"

class SendAdressesTest < ApplicationSystemTestCase
  setup do
    @send_adress = send_adresses(:one)
  end

  test "visiting the index" do
    visit send_adresses_url
    assert_selector "h1", text: "Send Adresses"
  end

  test "creating a Send adress" do
    visit send_adresses_url
    click_on "New Send Adress"

    fill_in "Address", with: @send_adress.address
    fill_in "Apartment", with: @send_adress.apartment
    fill_in "City", with: @send_adress.city
    fill_in "Post number", with: @send_adress.post_number
    fill_in "Prefectures", with: @send_adress.prefectures
    fill_in "Send family kana", with: @send_adress.send_family_kana
    fill_in "Send family name", with: @send_adress.send_family_name
    fill_in "Send first kana", with: @send_adress.send_first_kana
    fill_in "Send first name", with: @send_adress.send_first_name
    fill_in "Sendscol", with: @send_adress.sendscol
    fill_in "Tell number", with: @send_adress.tell_number
    fill_in "User", with: @send_adress.user_id
    click_on "Create Send adress"

    assert_text "Send adress was successfully created"
    click_on "Back"
  end

  test "updating a Send adress" do
    visit send_adresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @send_adress.address
    fill_in "Apartment", with: @send_adress.apartment
    fill_in "City", with: @send_adress.city
    fill_in "Post number", with: @send_adress.post_number
    fill_in "Prefectures", with: @send_adress.prefectures
    fill_in "Send family kana", with: @send_adress.send_family_kana
    fill_in "Send family name", with: @send_adress.send_family_name
    fill_in "Send first kana", with: @send_adress.send_first_kana
    fill_in "Send first name", with: @send_adress.send_first_name
    fill_in "Sendscol", with: @send_adress.sendscol
    fill_in "Tell number", with: @send_adress.tell_number
    fill_in "User", with: @send_adress.user_id
    click_on "Update Send adress"

    assert_text "Send adress was successfully updated"
    click_on "Back"
  end

  test "destroying a Send adress" do
    visit send_adresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Send adress was successfully destroyed"
  end
end
