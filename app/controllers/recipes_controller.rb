class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search_or_all(params[:search])
    render json: @recipes
  end
end
