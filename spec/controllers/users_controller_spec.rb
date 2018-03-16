# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user)   { create(:user) }
  let(:users)  { create_list(:user, 10) }

  describe 'GET index' do
    before(:each) do
      sign_in user
      get :index
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'has status code 200' do
      expect(response).to have_http_status(200)
    end

    # it 'assings @users' do
    #   expect(assigns(:users)).to eq(users)
    # end
  end

  describe 'GET show' do
    before(:each) do
      sign_in user
      get :show, params: { id: users.first.id }
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end

    it 'has status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'assigns @debt' do
      expect(assigns(:debt)).to be_a_new(Debt)
    end

    it 'assigns @dashboard' do
      expect(assigns(:dashboard)).to be_a(DashboardViewObject)
    end
  end
end
