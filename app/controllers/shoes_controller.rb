class ShoesController < ApplicationController
    def index
        @shoes = Shoe.ordered_by_price
    end

    def show
        @shoe = Shoe.find(params[:id])
    end

    def new 
        @shoe = Shoe.new
    end 

    def create
        @shoe = Shoe.new(shoe_params)
        
        if @shoe.save
            redirect_to shoe_path(@shoe)
        else
            render :new
        end 
    end 

    def edit
        @shoe = Shoe.find(params[:id])
    end 

    def update 
        @shoe = Shoe.find(params[:id])
        @shoe.update(shoe_params)
        redirect_to shoe_path(@shoe)
    end 

    def destroy 
        shoe = Shoe.find(params[:id])
        shoe.destroy
        redirect_to shoes_path

    end 


    def expensive
        @shoe = Shoe.ordered_by_price.first
    end

    private

    def shoe_params
        params[:shoe][:price_confirmation] = params[:shoe][:price_confirmation].to_f
        params.require(:shoe).permit(:brand, :price, :price_confirmation, :color, :limited_edition)
    end 

    def update_params
        params.require(:shoe).permit(:color, :price, :color)
    end 

end
