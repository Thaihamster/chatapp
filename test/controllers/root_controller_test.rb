require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_home_url
    assert_response :success
    assert_select "title", "ホーム | CHATAPP"
  end

  test "should get privacy" do
    get root_privacy_url
    assert_response :success
    assert_select "title", "プライバシーポリシー | CHATAPP"
  end

  test "should get contact" do
    get root_contact_url
    assert_response :success
    assert_select "title", "コンタクト | CHATAPP"
  end
end
