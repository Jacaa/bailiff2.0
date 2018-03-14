# frozen_string_literal: true

def set_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = { provider: 'facebook',
                                           uid: '1234',
                                           info: { email: 'example@example.com',
                                                   name:  'Name Surname',
                                                   image: 'no-avatar.png' } }
end
