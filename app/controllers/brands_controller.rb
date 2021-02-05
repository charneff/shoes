class BrandsController < ApplicationController
    before_action :set_brand, only: [:show, :update, :edit, :destroy]

    def new
        @brand = Brand.new
    end 

    def show
        
    end 
    
    def index
        @brands = Brand.all 
    end 

    def create
        @brand = Brand.new(brand_params)
        if @brand.save
            redirect_to brand_path(@brand)
        else
            render :new
        end
    end 

    def edit
       
    end

    def update
        @brand.update(brand_params)
        redirect_to brand_path(brand)
    end 

    def destroy
        @brand.destroy
        redirect_to brands_path
    end 


    private

    def brand_params
        params.require(:brand).permit(:name, :owner, shoes_attributes: [:price, :price_confirmation, :color, :limited_edition])
    end 

    def set_brand 
        @brand = Brand.find_by(id: params[:id])
    end 
    
end
