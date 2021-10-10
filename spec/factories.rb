# frozen_string_literal: true

FactoryBot.define do
  factory :customer do
    email { 'test@yopmail.com' }
    name { 'Test' }
    nationality { 'Australia' }
  end

  factory :vehicle do
    chassis_number { '888888888' }
    color { 'Black' }
    model { 'Ford Focus' }
    odometer_reading { 34000 }
    registration_date { '2019-11-02' }
    year { 2020 }
    customer { Customer.last }
  end
end
