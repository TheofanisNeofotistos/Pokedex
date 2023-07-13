json.pokemon do
    json.set! @pokemon.id do
        json.partial! 'api/pokemon/pokemon', pokemon: @pokemon
    end
end

moves = @pokemon.moves 

json.moves do 
    moves.each do |move|
        json.set! move.id do 
            json.extract! move, :id , :name
        end 
    end
end 