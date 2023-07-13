# @pokemon.each do |pokemon|
#     json.set! pokemon.id do
#         json.id pokemon.id
#         json.name pokemon.name
#         json.attack pokemon.attack
#         json.defense pokemon.defense
#         json.poke_type pokemon.poke_type
#         json.image_url pokemon.image_url

#         json.partial! 'pokemon', pokemon: pokemon
#             end
#         end
json.array! @pokemon, :id, :name, :attack, :defense, :poke_type, :image_url