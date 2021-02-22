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
      last_month = (today - 1.month).beginning_of_day
      new_moon = MoonAge.where(datetime: last_month..today.end_of_day).last

      difference = today - new_moon.datetime
      (difference / 60 / 60 / 24).round(1)
    end
  end
end
