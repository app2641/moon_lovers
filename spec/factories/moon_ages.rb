# frozen_string_literal: true

FactoryBot.define do
  factory :moon_age do
    today = Time.current

    year { today.year }
    month { today.month }
    date { today.to_date }
    datetime { today.beginning_of_day }
  end

  trait :'20220501' do
    year { 2022 }
    month { 5 }
    date { '2022/05/01' }
    datetime { '2022/05/01 05:28' }
  end

  trait :'20220530' do
    year { 2022 }
    month { 5 }
    date { '2022/05/30' }
    datetime { '2022/05/30 20:30' }
  end

  trait :'20220201' do
    year { 2022 }
    month { 2 }
    date { '2022/02/01' }
    datetime { '2022/02/01 14:46' }
  end
end
