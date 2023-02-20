# frozen_string_literal: true

class WordsController < ApplicationController
  before_action :set_word, only: [:destroy]

  def create
    @word = Word.new(word_params)

    if @word.save
      render json: @word, status: :created, location: @word
    else
      render json: @word.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @word.destroy
  end

  private

  def set_word
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:origin, :translation, :proficiency, :language, :list_id)
  end
end
