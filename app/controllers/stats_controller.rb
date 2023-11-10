# frozen_string_literal: true

class StatsController < ApplicationController
  def index
    all_words = current_user.lists.joins(:words).count
    known_words = current_user.lists.joins(:words).where(words: { proficiency: 100 }).count

    render json: { all: all_words, known: known_words }
  end
end
