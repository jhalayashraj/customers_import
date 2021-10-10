require 'rails_helper'

RSpec.describe "Customers", type: :request do
  let(:csv_path) { Rails.root.join('spec/fixtures/files/customers_import.csv') }
  let(:params) do
    {
      customers_import_csv: Rack::Test::UploadedFile.new(csv_path)
    }
  end

  describe 'GET #index' do
    before do
      create(:customer)
      create(:vehicle)
    end

    it 'returns http success' do
      get customers_url
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_customer_url
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'returns http success' do
      post customers_url, params: params
      expect(response).to redirect_to(customers_url)
    end
  end
end
