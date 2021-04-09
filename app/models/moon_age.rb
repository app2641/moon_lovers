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
      today = Time.current
      last_month = today - 2.months

      calculate(start_date: last_month, end_date: today)
    end

    private

    def calculate(start_date:, end_date:)
      new_moon = MoonAge.where(datetime: start_date.beginning_of_day..end_date.end_of_day).last

      difference = end_date - new_moon.datetime
      (difference / 60 / 60 / 24).round(1)
    end
  end
end
