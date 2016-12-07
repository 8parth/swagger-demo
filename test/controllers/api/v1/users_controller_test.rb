require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_user = api_v1_users(:one)
  end

  test "should get index" do
    get api_v1_users_url, as: :json
    assert_response :success
  end

  test "should create api_v1_user" do
    assert_difference('Api::V1::User.count') do
      post api_v1_users_url, params: { api_v1_user: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_user" do
    get api_v1_user_url(@api_v1_user), as: :json
    assert_response :success
  end

  test "should update api_v1_user" do
    patch api_v1_user_url(@api_v1_user), params: { api_v1_user: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_user" do
    assert_difference('Api::V1::User.count', -1) do
      delete api_v1_user_url(@api_v1_user), as: :json
    end

    assert_response 204
  end
end
