# frozen_string_literal: true

class Customer < ApplicationRecord
  ## Relationships
  has_many :vehicles, dependent: :destroy

  ## Validations
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  ## Scopes
  scope :search_by_name_or_model, lambda { |term|
                                    eager_load(:vehicles).where('name ILIKE :search OR model ILIKE :search',
                                                                search: "%#{term}%")
                                  }
  scope :customers_by_nationality, -> { group(:nationality).count }
  scope :average_odometer_reading_by_nationality, lambda {
                                                    eager_load(:vehicles).group(:nationality).average(:odometer_reading)
                                                  }
end
