class CreateRecipeUsers < ActiveRecord::Migration
  def change
    create_table :recipe_users do |t|
      t.references :recipe, index: true
      t.references :user, index: true
    end

    add_foreign_key :recipe_users, :recipes
    add_foreign_key :recipe_users, :users
  end
end
