# frozen_string_literal: true

class MoonAge < ApplicationRecord
  enum state: {
    new_moon: 0
  }

  validates :year, presence: true
  validates :month, presence: true
  validates :state, presence: true, inclusion: { in: states.keys }
  validates :date, presence: true
  validates :datetime, presence: true

  class << self
    def tonight
      Time.use_zone('Asia/Tokyo') do
        one_night(Time.current)
      end
    end

    def one_night(date)
      Time.use_zone('Asia/Tokyo') do
        last_month = date - 2.months

        age = calculate(start_date: last_month, end_date: date)
        MoonAge::Age.new(age:)
      end
    end

    private

    def calculate(start_date:, end_date:)
      new_moon = MoonAge.where(datetime: start_date.beginning_of_day..end_date).last
      raise 'MoonAge record is not applicable' if new_moon.nil?

      difference = end_date - new_moon.datetime
      (difference / 60 / 60 / 24).round(1)
    rescue StandardError => e
      logger.error "#{e.message}, start_date: #{start_date}, end_date: #{end_date}"
      0.0
    end
  end
end
