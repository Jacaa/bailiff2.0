# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Associations
  it { should have_many(:debts).dependent(:destroy) }
  it { should have_many(:credits).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  describe '#set_default_image' do
    let(:user)               { create(:user) }
    let(:user_without_image) { create(:user, image: nil) }

    context 'when user has an image' do
      it 'does not change current image' do
        expect(user.image).to eq('no-avatar.png')
      end
    end

    context 'when user has not an image' do
      it 'sets the image field to default value' do
        expect(user_without_image.image).to eq('no-avatar.png')
      end
    end
  end
end
