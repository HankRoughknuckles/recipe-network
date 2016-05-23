class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :recipe_users
  has_many :favorite_recipes, through: :recipe_users, source: :recipe


  ##################################################################
  # Instance Methods
  ##################################################################
  def add_recipe_to_favorites(recipe)
    unless has_favorited?(recipe)
      favorite_recipes << recipe
      save
      return true
    end
    return false
  end


  def remove_recipe_from_favorites(recipe)
    if has_favorited?(recipe)
      favorite_recipes.delete(recipe.id)
      save
      return true
    end
    return false
  end


  def has_favorited?(recipe)
    favorite_recipes.where(id: recipe.id).any?
  end
end
