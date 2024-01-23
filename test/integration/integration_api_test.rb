require 'test_helper'

class IntegrationApiTest < ActionDispatch::IntegrationTest
  
  setup do
    @auth_token = encode_token(user_id: 1)
  end

  test 'should create new user' do
    assert_difference('User.count') do
      post '/api/users', params: { user: { username: "user", password: "123ABc", password_confirmation: "123ABc" } }
    end
    body = JSON.parse(response.body)
    assert_response :success
    assert body["errors"].empty?
    assert body["data"].present?
    assert body["data"]["message"].present?
    assert body["data"]["bearer_token"].present?
  end

  test "should log in" do
    post '/api/login', params: { username: "user2", password: "123ABc" }
    body = JSON.parse(response.body)
    assert_response :success
    assert body["errors"].empty?
    assert body["data"].present?
    assert body["data"]["bearer_token"].present?
  end

  test 'should get index' do
    get '/api/products', headers: { 'Authorization' => "Bearer #{@auth_token}" }
    body = JSON.parse(response.body)
    assert_response :success
    assert body["errors"].empty?
    assert body["data"].present?
    assert body["data"]["products"].present?
  end

  test 'should create product' do
    post '/api/products', params: { product: { name: 'TestProduct' } }, headers: { 'Authorization' => "Bearer #{@auth_token}" }
    body = JSON.parse(response.body)
    assert_response :success
    assert body["errors"].empty?
    assert body["data"].present?
  end
end
