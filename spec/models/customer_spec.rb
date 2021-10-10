# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    subject { Customer.new(name: 'test', email: 'test@yopmail.com') }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'Associations' do
    it { should have_many(:vehicles) }
  end
end
