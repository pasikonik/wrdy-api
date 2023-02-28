# frozen_string_literal: true

class WordsController < ApplicationController
  def create
    word = Word.new(word_params)

    if word.save
      render json: word, status: :created, location: word
    else
      render json: word.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Word.find(params[:id]).destroy
  end

  private

  def word_params
    params.require(:word).permit(:origin, :translation, :list_id)
  end
end
