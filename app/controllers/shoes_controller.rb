class ShoesController < ApplicationController
    # layout 'shoe'
    before_action :find_shoe, :redirect_if_not_owner, only: [:show, :update, :edit, :destroy]

    def index
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @shoes = @brand.shoes
        else
            @shoes = Shoe.ordered_by_price.less_pricey(80)
        end 
    end

    def show
        
    end

    def new 
        byebug
        if params[:brand_id] && @brand = Brand.find_by_id(params[:brand_id])
            @shoe = @brand.shoes.build  
        else
            @shoe = Shoe.new
            @shoe.build_brand
        end 
    end 

    def create
        
        @shoe = current_user.shoes.build(shoe_params)
       byebug
        if @shoe.save
            redirect_to shoe_path(@shoe)
        else
            @brand = Brand.find_by_id(params[:brand_id]) if params[:brand_id] != ""
            render :new
        end 
    end 

    def edit
    
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

    def redirect_if_not_owner
        if @shoe.user != current_user
            redirect_to user_path(current_user), alert: "You can't edit this shoe!"
        end
    end

end
