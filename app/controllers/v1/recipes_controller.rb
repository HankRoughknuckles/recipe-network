class V1::RecipesController < ApplicationController
  before_action :set_recipe, except: [:new, :index]

  ##################################################################
  # GET #index
  ##################################################################
  def index
    @recipes = Recipe.search_or_all(params[:search])
    # render json: @recipes
  end


  ##################################################################
  # GET #show
  ##################################################################
  def show
    render json: @recipe, methods: :favorited_by?
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
