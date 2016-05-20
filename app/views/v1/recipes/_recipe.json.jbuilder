json.(recipe, 
      :id, 
      :name, 
      :description,
      :instructions)

json.favorited(recipe.favorited_by?(user))
