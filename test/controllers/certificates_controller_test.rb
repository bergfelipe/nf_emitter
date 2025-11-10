require "test_helper"

class CertificatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get certificates_new_url
    assert_response :success
  end

  test "should get create" do
    get certificates_create_url
    assert_response :success
  end

  test "should get destroy" do
    get certificates_destroy_url
    assert_response :success
  end

  test "should get show" do
    get certificates_show_url
    assert_response :success
  end
end
