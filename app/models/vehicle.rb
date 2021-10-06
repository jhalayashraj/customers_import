# frozen_string_literal: true

class Vehicle < ApplicationRecord
  ## Relationships
  belongs_to :customer

  ## Validations
  validates :chassis_number, :model, presence: true
end
