# frozen_string_literal: true

class MoonAge
  class Age
    attr_reader :age
    alias value age

    def initialize(age:)
      @age = age
    end

    def full_moon?
      age.round == 15
    end

    def new_moon?
      [0, 30].include?(age.round)
    end
  end
end
