# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show update destroy]

  def index
    @lists = current_user.lists

    render json: @lists
  end

  def show
    render json: @list
  end

  def create
    @list = List.new(list_params.merge(user_id: current_user.id))

    if @list.save
      render json: @list, status: :created, location: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.permit(:name)
  end
end
