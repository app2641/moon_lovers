# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoonAge, type: :model do
  describe '#tonight' do
    subject { travel_to(tonight) { MoonAge.tonight } }

    context 'when 2021/02/22' do
      let(:tonight) { Time.zone.local(2021, 2, 22).end_of_day }

      before { create :moon_age, :'202102' }

      it { is_expected.to eq 10.8 }
    end

    context 'when 2022/02/22' do
      let(:tonight) { Time.zone.local(2022, 2, 22).end_of_day }

      before { create :moon_age, :'202202' }

      it { is_expected.to eq 21.4 }
    end
  end
end
