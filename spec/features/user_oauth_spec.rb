# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User oauth', type: :feature do
  scenario 'User sign up using Facebook' do
    set_omniauth
    visit '/users/sign_up'
    click_on(class: 'facebook')
    expect(page).to have_text(/Successfully authenticated/)
  end

  scenario 'User log in using Facebook' do
    set_omniauth
    visit '/users/sign_in'
    click_on(class: 'facebook')
    expect(page).to have_text(/Successfully authenticated/)
  end
end
