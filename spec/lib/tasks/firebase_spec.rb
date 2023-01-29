# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'firebase' do
  describe '#notify_moon_age' do
    subject(:execute_task) { rake['firebase:notify_moon_age'].execute }

    include_context 'with rake'

    let(:payload) do
      {
        message: {
          topic: Fcm::Topic::TONIGHT,
          notification: {
            title: '月齢通知',
            body:
          }
        }
      }
    end

    before do
      allow(Fcm::Topic).to receive(:notify)
      allow(MoonAge).to receive(:one_night).and_return(age)
      execute_task
    end

    context 'when age is not full moon' do
      let(:age) { MoonAge::Age.new(age: 15.5) }
      let(:body) { '今夜の月齢は15.5です' }

      it { expect(Fcm::Topic).to have_received(:notify).with(payload).once }
    end

    context 'when age is full moon' do
      let(:age) { MoonAge::Age.new(age: 15.4) }
      let(:body) { '今夜は満月です' }

      it { expect(Fcm::Topic).to have_received(:notify).with(payload).once }
    end

    context 'when age is new moon' do
      let(:age) { MoonAge::Age.new(age: 0.4) }
      let(:body) { '今夜は新月です' }

      it { expect(Fcm::Topic).to have_received(:notify).with(payload).once }
    end
  end
end
