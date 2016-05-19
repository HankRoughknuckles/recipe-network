class V1::RecipesController < ApplicationController
  before_action :set_recipe, except: [:new, :index]

  ##################################################################
  # GET #index
  ##################################################################
  def index
    @recipes = Recipe.search_or_all(params[:search])
  end


  ##################################################################
  # GET #show
  ##################################################################
  def show
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
