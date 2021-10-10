# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:chassis_number) }
    it { should validate_presence_of(:model) }
  end

  describe 'Associations' do
    it { should belong_to(:customer) }
  end
end
