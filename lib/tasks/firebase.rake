# frozen_string_literal: true

namespace :firebase do
  desc 'Notify the age of moon to Firebase'
  task notify_moon_age: :environment do
    token = GoogeAuth.access_token
  end
end
