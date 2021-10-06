# frozen_string_literal: true

class Customer < ApplicationRecord
  ## Relationships
  has_many :vehicles, dependent: :destroy

  ## Validations
  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
