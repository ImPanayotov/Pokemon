require 'rails_helper'

RSpec.describe Type, type: :model do
  context 'validations' do
    subject { build(:type) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }

    it { is_expected.to validate_length_of(:name).is_at_most(255) }
  end

  context 'associations' do
    it { is_expected.to have_and_belong_to_many(:pokemons) }
  end
end
