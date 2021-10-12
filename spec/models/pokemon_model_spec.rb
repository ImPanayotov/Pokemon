require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  context 'validations' do
    subject { build(:pokemon) }

    %i[poke_id name].each do |field|
      it { is_expected.to validate_presence_of(field) }
    end

    %i[base_experience height weight order].each do |field|
      it { is_expected.not_to validate_presence_of(field) }
    end

    %i[name poke_id].each do |field|
      it { is_expected.to validate_uniqueness_of(field).ignoring_case_sensitivity }
    end

    it { is_expected.to validate_length_of(:name).is_at_most(255) }
  end

  context 'associations' do
    it { is_expected.to have_and_belong_to_many(:types) }
  end
end
