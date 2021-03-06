class V1::FavoriteRecipesController < ApplicationController
  before_action :set_recipe, except: [:new, :index]

  def index
    @recipes = current_user.favorite_recipes
    render 'v1/recipes/index'
  end


  def create
    current_user.add_recipe_to_favorites(@recipe)
    render 'v1/recipes/show'
  end


  def destroy
    current_user.remove_recipe_from_favorites(@recipe)
    render 'v1/recipes/show'
  end


  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
end
