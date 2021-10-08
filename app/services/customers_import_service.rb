# frozen_string_literal: true

require 'csv'
class CustomersImportService
  attr_reader :file_name

  def initialize(csv_file:)
    @file_name = csv_file
  end

  def start_import
    CSV.foreach(file_name, headers: true, header_converters: :symbol, converters: :all) do |row|
      ActiveRecord::Base.transaction do
        store_customer_and_vehicles(row)
      end
    end
  rescue StandardError => e
    Rails.logger.error(e.message)
  end

  private

  def store_customer_and_vehicles(row)
    customer = Customer.find_or_initialize_by(email: row[:email])
    customer.assign_attributes(name: row[:name], nationality: row[:nationality])
    vehicle = customer.vehicles.find_or_initialize_by(chassis_number: row[:chassisnumber])
    vehicle.assign_attributes(model: row[:model], year: row[:year], color: row[:color],
                              registration_date: row[:registrationdate],
                              odometer_reading: row[:odometerreading])
    customer.save!
  end
end
