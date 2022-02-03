#<User :id, :username, :email, :role: "headchef"||"souschef"||"linecook">
json.array! @users do |u|
  json.id u.id
  json.username u.username
  json.email u.email
  json.role u.role
end