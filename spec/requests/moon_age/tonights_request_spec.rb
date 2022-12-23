# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'MoonAge::TonightsController' do
  describe 'GET /show' do
    let(:tonight) { Time.zone.local(2022, 3, 2).end_of_day }
    let(:expected) { { age: 29.4 }.stringify_keys }

    before do
      create(:moon_age, :'20220201')

      travel_to(tonight) { get moon_age_tonight_path }
    end

    it { expect(response).to have_http_status :ok }
    it { expect(JSON.parse(response.body)).to eq expected }
  end
end
