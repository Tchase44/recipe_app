# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#<Recipe id: nil, title: nil, description: nil, tips: nil, directions: nil>
#<Ingredient id: nil, name: nil, amount: nil, recipe_id: nil,>

r = [
  {
    title:"Cheesy 'Tatoes",
    directions: "Mix hash browns, sour cream, cheese, cream of chicken, and butter.\n
Put in casserole dish.\n
Mix crumbs and butter and pour overtop.\n
350 for 1 hour.\n",
  items: [
      {name: "southern style hash browns", amount: "2 lbs"},
      {name: "Shredded Cheese(cheddar)", amount: "1/2 cup"},
      {name: "Sour Cream", amount: "1 cup"},
      {name: "cream of chicken", amount: "1 can"},
      {name: "stick of buttah", amount: "1"},
      {name: "cornflake/bread/chip crumbs (optional)", amount: "1 1/2"},
      {name: "butter (for crum topping)", amount: "4 tbsp"}
    ]
  },
  {
    title: "Breakfast Sausage (1 lbs)",
    directions: "Mix all the spices together in a bowl.\n
Brown the meat in a pan.\n
Pour in spices and stir.\n
Cook until meat reaches your prefered level of doneness.\n",
    items:[
      {amount: "1 lbs" ,name: "Ground Meat"},
      {amount: "1 tsp" ,name: "kosher salt"},
      {amount: "3/4 tsp" ,name: "ground black pepper"},
      {amount: "1 tsp" ,name: "sage leaves"},
      {amount: "1 tsp" ,name: "thyme leaves"},
      {amount: "1/4" ,name: "rosemary leaves"},
      {amount: "1/2" ,name: "light brown sugar"},
      {amount: "1/4 tsp" ,name: "nutmeg"},
      {amount: "1/4 tsp" ,name: "cayenne pepper"},
      {amount: "1/4 tsp" ,name: "red pepper flakes"}
    ]
  },
  {
    title: "Breakfast Sausage (2 lbs)",
    directions: "Mix all the spices together in a bowl.\n
Brown the meat in a pan.\n
Pour in spices and stir.\n
Cook until meat reaches your prefered level of doneness.\n",
    items:[
      {amount: "2 lbs" ,name: "Ground Meat"},
      {amount: "2 tsp" ,name: "kosher salt"},
      {amount: "1 1/2 tsp" ,name: "ground black pepper"},
      {amount: "2 tsp" ,name: "sage leaves"},
      {amount: "2 tsp" ,name: "thyme leaves"},
      {amount: "1/2 tsp" ,name: "rosemary leaves"},
      {amount: "1 tsp" ,name: "light brown sugar"},
      {amount: "1/2 tsp" ,name: "nutmeg"},
      {amount: "1/2 tsp" ,name: "cayenne pepper"},
      {amount: "1/2 tsp" ,name: "red pepper flakes"}
    ]
  },
  {
    description: "Proin eu mi. nila ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.",
    directions: "Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus. Aenean fermentum. Donec ut mauris eget massa tempor convallis. nila neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; nila dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.",
    tips: nil,
    title: "Laniaurius atrococcineus",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.",
    directions: "In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.",
    tips: nil,
    title: "Colaptes campestroides",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: nil,
    directions: "Fusce consequat. nila nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. nila justo. Aliquam quis turpis eget elit sodales scelerisque.",
    tips: nil,
    title: "Tamandua tetradactyla",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Maecenas ut massa quis augue luctus tincidunt. nila mollis molestie lorem. Quisque ut erat.",
    directions: "Phasellus in felis. Donec semper sapien a libero. Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nila. Sed accumsan felis. Ut at dolor quis odio consequat varius.",
    tips: nil,
    title: "Stercorarius longicausus",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: nil,
    directions: "In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. nila nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst.",
    tips: nil,
    title: "Axis axis",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.",
    directions: "Morbi non quam nec dui luctus rutrum. nila tellus. In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.",
    tips: nil,
    title: "Macropus eugenii",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: nil,
    directions: "Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. nilam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo.",
    tips: nil,
    title: "Macaca mulatta",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Praesent blandit.",
    directions: "Aenean fermentum. Donec ut mauris eget massa tempor convallis. nila neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.",
    tips: nil,
    title: "unavailable",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
    directions: "Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. nila justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.",
    tips: nil,
    title: "Otocyon megalotis",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }, {
    description: "Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.",
    directions: "In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.",
    tips: nil,
    title: "Varanus sp.",
    items: [{
  name: "Sole - Fillet",
  amount: 6
}, {
  name: "Tuna - Bluefin",
  amount: 1
}, {
  name: "Whmis Spray Bottle Graduated",
  amount: 5
}, {
  name: "Pasta - Canelloni, Single Serve",
  amount: 4
}, {
  name: "Ham - Cooked Bayonne Tinned",
  amount: 9
}, {
  name: "Remy Red Berry Infusion",
  amount: 8
}]
  }]
r.each_with_index do |rp,i|
  url = "#{rp[:title].parameterize(separator: "-")}"
  newRP = Recipe.new({title: rp[:title], directions: rp[:directions], description: rp[:description],slug: url})
  newRP.save!
  rp[:items].each do |i|
    ii = Ingredient.new({amount: i[:amount], name: i[:name],recipe_id: newRP.id})
    ii.save!
  end
end

User.create({
  password: "notapassword",
  password_confirmation: "notapassword",
  username: "theneck",
  role: "headchef",
  email: "theneck4544@gmail.com",
})
puts "Seeeding Complete"






















