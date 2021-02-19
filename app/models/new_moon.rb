# frozen_string_literal: true

class NewMoon < ApplicationRecord
  validates :year, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :date, presence: true
end
