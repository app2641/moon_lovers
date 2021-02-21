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
end
