# frozen_string_literal: true

EXCEPT_ATTRIBUTES = %i[created_at updated_at].freeze

class WordsController < ApplicationController
  def index
    list = List.find(params[:list_id])

    render json: list.words, except: EXCEPT_ATTRIBUTES
  end

  def create
    word = Word.new(word_params)

    if word.save
      render json: word, except: EXCEPT_ATTRIBUTES, status: :created, location: word
    else
      render json: word.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Word.find(params[:id]).destroy!

    head :no_content
  end

  private

  def word_params
    params.require(:word).permit(:origin, :translation, :list_id)
  end
end
