# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DebtsController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST create' do
    before(:each) { sign_in user }

    context 'with valid parameters' do
      it 'save a new debt' do
        expect{
          post :create, params: { user_id: user.id,
                                  debt: attributes_for(:debt) }
        }.to change(Debt, :count).by(1)
      end

      it 'redirects to root path' do
        post :create, params: { user_id: user.id, debt: attributes_for(:debt) }
        expect(response).to redirect_to root_path
      end

      it 'has status code 302' do
        post :create, params: { user_id: user.id, debt: attributes_for(:debt) }
        expect(response).to have_http_status(302)
      end
    end

    context 'with invalid parameters' do
      it 'does not save a new debt' do
        expect{
          post :create, params: { user_id: user.id,
                                  debt: attributes_for(:debt, purpose: nil) }
        }.to_not change(Debt, :count)
      end

      it 'renders the show user template' do
        post :create, params: { user_id: user.id,
                                debt: attributes_for(:debt, purpose: nil) }
        expect(response).to render_template('users/show')
      end

      it 'has status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET history' do
    before(:each) do
      sign_in user
      get :history, params: { user_id: user.id }
    end

    it 'renders the history template' do
      expect(response).to render_template(:history)
    end

    it 'has status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'assign @dashboard' do
      expect(assigns(:dashboard)).to be_a(DashboardViewObject)
    end
  end

  describe 'PUT set_as_covered' do
    let(:debt) { create(:debt, paid: false,
                               debtor_id: user.id,
                               creditor_id: user.id) }

    before(:each) do
      sign_in user
      put :set_as_covered, params: { user_id: user.id, debt_id: debt.id,
                                     debt: attributes_for(:debt,
                                                          paid: true,
                                                          debtor_id: user.id,
                                                          creditor_id: user.id) }
    end
    it 'sends notification email' do
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'redirects to root path' do
      expect(response).to redirect_to root_path
    end

    it 'update debt attribute' do
      expect(assigns(:debt).paid).to eq(true)
    end
  end
end
