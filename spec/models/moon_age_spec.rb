# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoonAge do
  around do |example|
    Time.use_zone('Asia/Tokyo', &example)
  end

  describe '#tonight' do
    subject { travel_to(tonight) { MoonAge.tonight.age } }

    context 'when 2022/03/02, longer than 1 month' do
      let(:tonight) { Time.zone.local(2022, 3, 2).end_of_day }

      before { create(:moon_age, :'20220201') }

      it { is_expected.to eq 29.4 }
    end

    context 'when 2021/02/22, there are twice a month' do
      let(:tonight) { Time.zone.local(2022, 5, 31).end_of_day }

      before do
        create(:moon_age, :'20220501')
        create(:moon_age, :'20220530')
      end

      it { is_expected.to eq 1.1 }
    end

    context 'when 2021/06/10, new moon is today' do
      let(:tonight) { Time.zone.local(2022, 5, 30, 1, 29) }

      before do
        create(:moon_age, :'20220501')
        create(:moon_age, :'20220530')
      end

      it { is_expected.to eq 28.8 }
    end

    context 'when JST time' do
      let(:tonight) { Time.zone.local(2021, 5, 12, 21, 35) }

      before do
        create(:moon_age,
               year: 2021, month:	5, state: 0, date: '2021/05/12', datetime: '2021/05/12 04:00')
      end

      it { is_expected.to eq 0.7 }
    end
  end

  describe '#one_night' do
    subject { MoonAge.one_night(date).age }

    context 'when 2022/03/02, longer than 1 month' do
      let(:date) { Time.zone.local(2022, 3, 2).end_of_day }

      before { create(:moon_age, :'20220201') }

      it { is_expected.to eq 29.4 }
    end

    context 'when 2021/02/22, there are twice a month' do
      let(:date) { Time.zone.local(2022, 5, 31).end_of_day }

      before do
        create(:moon_age, :'20220501')
        create(:moon_age, :'20220530')
      end

      it { is_expected.to eq 1.1 }
    end

    context 'when 2021/06/10, new moon is today' do
      let(:date) { Time.zone.local(2022, 5, 30, 1, 29) }

      before do
        create(:moon_age, :'20220501')
        create(:moon_age, :'20220530')
      end

      it { is_expected.to eq 28.8 }
    end

    context 'when the new moon is not applicable' do
      let(:date) { Time.current }

      it { is_expected.to eq 0.0 }
    end
  end
end
