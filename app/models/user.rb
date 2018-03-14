# frozen_string_literal: true

# :nodoc
class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  before_save :set_default_image

  private

  def set_default_image
    self.image ||= 'no-avatar.png'
  end
end
