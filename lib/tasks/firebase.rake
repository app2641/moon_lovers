# frozen_string_literal: true

namespace :firebase do
  desc 'Notify the age of moon to Firebase'
  task notify_moon_age: :environment do
    tonight = Time.current.beginning_of_day + 22.hours
    age = MoonAge.one_night(tonight)

    payload = {
      message: {
        topic: Fcm::Topic::TONIGHT,
        android: {
          data: {
            title: '今夜の月齢',
            body: "今夜の月齢は#{age.value}です"
          }
        }
      }
    }

    Fcm::Topic.notify(payload)
  end
end
