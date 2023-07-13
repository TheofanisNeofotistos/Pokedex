json.pokemon do
    json.set! @pokemon.id do
        json.partial! 'api/pokemon/pokemon', pokemon: @pokemon
    end
end