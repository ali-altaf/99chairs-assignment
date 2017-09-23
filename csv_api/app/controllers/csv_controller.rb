class CsvController < ApplicationController
  require 'csv'

  def process_csv
    begin
      render json: {success: true, first_name_counts: Name.process_names(csv_params)}
    rescue => error
      render json: {success: false, error_message: "Error Occurred while processing CSV"}
    end
  end

  def csv_params
    params.require(:data)
  end
end
