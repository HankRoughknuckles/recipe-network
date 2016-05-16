class Recipe < ActiveRecord::Base
  has_many :recipe_users
  has_many :fans, through: :recipe_users, source: :user

  ##################################################################
  # Class methods
  ##################################################################
  # returns recipes where the name is like the passed name, if no name
  # given, then returns all recipes
  def self.search_or_all(name = "")
    name.present? ? Recipe.where('name ILIKE ?', "%#{name}%") : Recipe.all
  end
end
