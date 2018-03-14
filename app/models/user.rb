# frozen_string_literal: true

# :nodoc
class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook]

  before_save :set_default_image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      full_name       = get_full_name_from_auth(auth)
      user.first_name = full_name[0]
      user.last_name  = full_name[1]
      user.email      = auth.info.email
      user.image      = auth.info.image
      user.password   = Devise.friendly_token[0, 20]
    end
  end

  private

  def get_full_name_from_auth(auth)
    auth.info['name'].split(' ')
  end

  def set_default_image
    self.image ||= 'no-avatar.png'
  end
end
