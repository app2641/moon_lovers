# frozen_string_literal: true

namespace :moon_age do
  desc 'Push notifications via Firebase'
  task push_notifications: :environment do
    { age: MoonAge.tonight }
  end
end
