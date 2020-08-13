require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
json = open(url).read
objs = JSON.parse(json)
objs['drinks'].each do |obj|
   ingredient = obj["strIngredient1"]
   Ingredient.create(name:ingredient)
end
