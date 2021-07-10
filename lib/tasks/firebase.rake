# frozen_string_literal: true

namespace :firebase do
  desc 'Notify the age of moon to Firebase'
  task notify_moon_age: :environment do
    tonight = Time.use_zone('Asia/Tokyo') do
      Time.current.beginning_of_day + 22.hours
    end
    age = MoonAge.one_night(tonight)
    body = if age.full_moon?
             '今夜は満月です'
           elsif age.new_moon?
             '今夜は新月です'
           else
             "今夜の月齢は#{age.value}です"
           end

    payload = {
      message: {
        topic: Fcm::Topic::TONIGHT,
        notification: {
          title: '月齢通知',
          body: body
        }
      }
    }

    Fcm::Topic.notify(payload)
  end
end
