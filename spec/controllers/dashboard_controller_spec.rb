# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET index' do
    before(:each) { get :index }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'has status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
