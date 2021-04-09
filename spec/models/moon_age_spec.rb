# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoonAge, type: :model do
  describe '#tonight' do
    subject { travel_to(tonight) { MoonAge.tonight } }

    context 'when 2022/03/02, longer than 1 month' do
      let(:tonight) { Time.zone.local(2022, 3, 2).end_of_day }

      before { create :moon_age, :'20220201' }

      it { is_expected.to eq 29.4 }
    end

    context 'when 2021/02/22, there are twice a month' do
      let(:tonight) { Time.zone.local(2022, 5, 31).end_of_day }

      before do
        create :moon_age, :'20220501'
        create :moon_age, :'20220530'
      end

      it { is_expected.to eq 1.1 }
    end
  end

  describe '#one_night' do
    subject { MoonAge.one_night(date) }

    context 'when 2022/03/02, longer than 1 month' do
      let(:date) { Time.zone.local(2022, 3, 2).end_of_day }

      before { create :moon_age, :'20220201' }

      it { is_expected.to eq 29.4 }
    end

    context 'when 2021/02/22, there are twice a month' do
      let(:date) { Time.zone.local(2022, 5, 31).end_of_day }

      before do
        create :moon_age, :'20220501'
        create :moon_age, :'20220530'
      end

      it { is_expected.to eq 1.1 }
    end

    context 'when the new moon is not applicable' do
      let(:date) { Time.current }

      it { is_expected.to eq 0.0 }
    end
  end
end
