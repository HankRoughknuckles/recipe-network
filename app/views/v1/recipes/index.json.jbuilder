json.array! @recipes do |recipe|
  json.partial! 'v1/recipes/recipe', locals: { recipe: recipe, 
                                               user: current_user }
end
