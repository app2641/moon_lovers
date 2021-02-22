# frozen_string_literal: true

FactoryBot.define do
  factory :moon_age do
    today = Time.current

    year { today.year }
    month { today.month }
    date { today.to_date }
    datetime { today.beginning_of_day }
  end

  trait :'202102' do
    year { 2021 }
    month { 2 }
    date { '2021/02/12' }
    datetime { '2021/02/12 04:06' }
  end

  trait :'202202' do
    year { 2022 }
    month { 2 }
    date { '2022/02/01' }
    datetime { '2022/02/01 14:46' }
  end
end
