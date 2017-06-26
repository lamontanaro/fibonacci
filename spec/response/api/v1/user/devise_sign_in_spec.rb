require 'rails_helper'

describe 'User login', type: :request do
  let!(:test_user) { create(:user) }

  context 'Sending valid data' do
    it 'successfully logs in' do
      login_params = { email: 'partnership@example.com', password: 'partnership'}
      post api_v1_user_session_path, params: login_params
      client_id = response.headers['client']
      token = response.headers['access-token']

      expect(response).to have_http_status(:success)
      expect(test_user.reload.valid_token?(token, client_id)).to be_truthy
    end
  end

  context 'Sending invalid data' do
    it 'returns unauthorized status' do
      login_params = { email: 'invalid@example.com', password: 'invalid' }
      post api_v1_user_session_path, params: login_params

      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to include('Invalid login credentials. Please try again.')
    end
  end
end
