class Api::ShelfController < ApplicationController
  def show
    shelves = Section.find(params[:id]).shelves
    shelves_array = shelves.pluck(:name, :id)
    render json: shelves_array
  end
end
