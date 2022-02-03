#<Recipe id: nil, title: nil, description: nil, tips: nil, directions: nil>
json.array! @recipes do |r|
  json.id r.id
  json.title r.title
  json.slug r.slug
  json.description r.description
  json.directions r.directions
  json.tips r.tips
  json.ingredients r.ingredients
end