# frozen_string_literal: true

class CustomersController < ApplicationController
  def index
    @customers = Customer.includes(:vehicles)
  end

  def new; end

  def create
    csv_file = params[:customers_import_csv]
    CustomersImportService.new(csv_file: csv_file).start_import
    redirect_to customers_path
  end
end
