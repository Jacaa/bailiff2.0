# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Debt, type: :model do
  # Associations
  it { should belong_to(:debtor) }
  it { should belong_to(:creditor) }
  # Validations
  it { should validate_presence_of(:purpose) }
  it { should validate_length_of(:purpose).is_at_most(200) }

  it { should validate_presence_of(:amount) }
  it { should validate_numericality_of(:amount).is_greater_than(0) }

  describe '#deadline_is_possible?' do
    let(:users) { create_list(:user, 2) }
    let(:debt) do
      build(:debt,
            deadline:    1.hour.ago,
            debtor_id:   users.first.id,
            creditor_id: users.last.id)
    end

    it { expect(debt).to be_invalid }
    it 'returns errors message' do
      debt.save
      expect(debt.errors[:deadline]).to eq(['must be later than date'])
    end
  end
end
