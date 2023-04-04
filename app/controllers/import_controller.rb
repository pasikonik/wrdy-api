# frozen_string_literal: true

require 'csv'

class ImportController < ApplicationController
  def create
    ::CSV.foreach(file, row_sep: :auto, skip_blanks: true) do |origin, translation|
      list.words.build(origin: origin.downcase, translation: translation.downcase)
    end
    if list.save
      render json: list, only: %i[id name]
    else
      render json: list.errors, status: :unprocessable_entity
    end
  end

  private

  def list
    @list ||= List.find_or_create_by(name: import_params[:list], user_id: current_user.id)
  end

  def file
    import_params[:file].tempfile
  end

  def import_params
    params.permit(:list, :file)
  end
end
