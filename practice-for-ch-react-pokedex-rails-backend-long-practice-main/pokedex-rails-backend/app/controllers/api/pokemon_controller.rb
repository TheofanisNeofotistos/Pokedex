class Api::PokemonController < ApplicationController
    def types
        render json: Pokemon::TYPES
    end

    def index
        @pokemon = Pokemon.all()
       
        render 'api/pokemon/index'
        # render :index
    end

    def show
        @pokemon = Pokemon.find_by(id: params[:id])
   
        render :show
    end


    
end
