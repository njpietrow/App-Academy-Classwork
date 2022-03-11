# pokemon
json.pokemon do
  json.set! @pokemon.id do
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type
    json.image_url asset_path("pokemon_snaps/#{@pokemon.image_url}")
  end
end

# moves
json.moves @pokemon.moves do |move|
  json.set! move.id do
    json.extract! move, :id, :name
  end
end

# items