# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoonAge::Age, type: :model do
  describe '#full_moon?' do
    subject { described_class.new(age: age).full_moon? }

    context 'when age is full moon' do
      let(:age) { 14.5 }

      it { is_expected.to be true }
    end

    context 'when age is not full moon' do
      let(:age) { 14.4 }

      it { is_expected.to be false }
    end
  end
end
