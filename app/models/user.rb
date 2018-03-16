# frozen_string_literal: true

# :nodoc
class User < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_full_name, against: %i[first_name last_name],
                                        using: { tsearch: { prefix: true } }

  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: %i[facebook]

  has_many :debts,   class_name: 'Debt',
                     foreign_key: 'debtor_id',
                     dependent: :destroy,
                     inverse_of: :debtor

  has_many :credits, class_name: 'Debt',
                     foreign_key: 'creditor_id',
                     dependent: :destroy,
                     inverse_of: :creditor

  before_save :set_default_image

  def self.from_omniauth(auth)
    where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
      full_name       = get_full_name(auth)
      user.first_name = full_name[0]
      user.last_name  = full_name[1]
      user.email      = auth[:info][:email]
      user.image      = auth[:info][:image]
      user.password   = Devise.friendly_token[0, 20]
    end
  end

  private

  def set_default_image
    self.image ||= 'no-avatar.png'
  end

  class << self
    def get_full_name(auth)
      auth[:info][:name].split(' ')
    end
  end
end
