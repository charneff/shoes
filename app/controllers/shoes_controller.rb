class ShoesController < ApplicationController
    layout 'shoe'
    before_action :find_shoe, only: [:show, :update, :edit, :destroy]

    def index
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @shoes = @brand.shoes.ordered_by_price
        else
            @shoes = Shoe.ordered_by_price
        end 
    end

    def show
        
    end

    def new 
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            # @shoe = Shoe.new
            # @shoe.brand = @brand 
            @shoe = @brand.shoes.build
           
        else
            @shoe = Shoe.new
            @shoe.build_brand
        end 
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
      
        @shoe.update(shoe_params)
        redirect_to shoe_path(@shoe)
    end 

    def destroy 
        
        shoe.destroy
        redirect_to shoes_path

    end 


    def expensive
        @shoe = Shoe.ordered_by_price.first
    end

    private

    def shoe_params
        params[:shoe][:price_confirmation] = params[:shoe][:price_confirmation].to_f
        params.require(:shoe).permit(:brand_id, :price, :price_confirmation, :color, :limited_edition, brand_attributes: [:name, :owner])
    end 

    def update_params
        params.require(:shoe).permit(:color, :price, :color)
    end 
    
    def find_shoe
        @shoe = Shoe.find(params[:id])
    end 

end
