# frozen_string_literal: true

class MoonAge::Age
  attr_reader :age

  def initialize(age:)
    @age = age
  end

  def full_moon?
    age.round == 15
  end
end
