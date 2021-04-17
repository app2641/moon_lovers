# frozen_string_literal: true

class MoonAge
  class TonightsController < ApplicationController
    def show
      tonight = MoonAge.tonight

      render json: { age: tonight.age }, status: :ok
    end
  end
end
