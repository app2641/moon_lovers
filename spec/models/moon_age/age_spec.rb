# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoonAge::Age do
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

  describe '#new_moon?' do
    subject { described_class.new(age: age).new_moon? }

    context 'when age is 0.4' do
      let(:age) { 0.4 }

      it { is_expected.to be true }
    end

    context 'when age is 0.5' do
      let(:age) { 0.5 }

      it { is_expected.to be false }
    end

    context 'when age is 29.4' do
      let(:age) { 29.4 }

      it { is_expected.to be false }
    end

    context 'when age is 29.5' do
      let(:age) { 29.5 }

      it { is_expected.to be true }
    end
  end
end
