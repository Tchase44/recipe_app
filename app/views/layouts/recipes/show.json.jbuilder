#<Recipe id: nil, title: nil, description: nil, tips: nil, directions: nil>
#<Ingredient id: nil, name: nil, amount: nil, recipes_id: nil,>
json.id @recipe.id
json.title @recipe.title
json.slug @recipe.slug
json.description @recipe.description
json.directions @recipe. directions
json.tips @recipe.tips
json.ingredients @recipe.ingredients
json.errors = @recipe.errors.to_json if @recipe.errors.full_messages.length > 0