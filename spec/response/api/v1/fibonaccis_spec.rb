require 'rails_helper'

describe "Fibonnacci API", type: :request do
  let!(:test_user) { create(:user) }

  context 'When user is logged in' do
    it 'GET#show returns success status' do
      get api_v1_fibonaccis_path(n: 15), headers: login_headers
      expect(response).to have_http_status(:success)

      expect(json['serie']).to be_present
    end

    it 'GET#show invalid number returns bad request status' do
      get api_v1_fibonaccis_path(n: -5), headers: login_headers

      expect(response).to have_http_status(:bad_request)
      expect(json['message']).to eq("Invalid Number")
    end
  end

  context 'When user is not logged' do
    it 'GET#show returns unauthorized status' do
      get api_v1_fibonaccis_path(n: 5)

      expect(response).to have_http_status(:unauthorized)
      expect(json['errors']).to include('You need to sign in or sign up before continuing.')
    end
  end
end
