# frozen_string_literal: true

class MoonAge::TonightsController < ApplicationController
  def show
    age = MoonAge.tonight

    render json: { age: age }, status: :ok
  end
end
