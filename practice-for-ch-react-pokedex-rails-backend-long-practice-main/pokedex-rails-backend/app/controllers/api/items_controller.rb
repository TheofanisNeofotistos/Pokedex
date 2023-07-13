class Api::ItemsController < ApplicationController
    def index 
        @items = Item.all 

        render :index 
    end 

    def show 
        @item = Item.find_by(id: params[:id])
        
        render :show 
    end 

    def create 
        @item = Item.new(item_params)

        if(@item.save){
            render :show
        } else {
            render json: @item.errors.full_messages, status: 422
        }
    end 

    def destroy 
        @item = Item.find_by(id: params[:id])

        @item.delete

        render :index
    end 

    private 

    def item_params
        params.require(:item).permit(:id, :pokemon_id, :name, :price, :happiness, :image_url)
    end 

end
