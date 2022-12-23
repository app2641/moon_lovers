# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fcm::Topic do
  let(:klass) { described_class }

  describe '#notify' do
    let(:url) { "https://fcm.googleapis.com/v1/projects/#{ENV.fetch('FIREBASE_PROJECT_ID', nil)}/messages:send" }
    let(:payload) { { body: 'data' } }

    before { allow(GoogleAuth).to receive(:access_token).and_return('access_token') }

    context 'when publish to fcm is successful' do
      before do
        stub_request(:post, url)
          .with(body: JSON.generate(payload))
          .to_return(status: 200, body: '')
      end

      it do
        response = klass.notify(payload)

        aggregate_failures do
          expect(response.class).to eq Faraday::Response
          expect(response.status).to eq 200
        end
      end
    end

    context 'when publish to fcm is failure' do
      before do
        stub_request(:post, url)
          .with(body: JSON.generate(payload))
          .to_return(status: 400, body: 'bad request')
      end

      it { expect { klass.notify(payload) }.to raise_error(Fcm::Error::BadRequestError, 'bad request') }
    end
  end
end
