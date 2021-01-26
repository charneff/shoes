class BrandsController < ApplicationController

    def new
        @brand = Brand.new
        3.times { @brand.shoes.build }
    end 

    def show
        @brand = Brand.find_by(id: params[:id])
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
        @brand = Brand.find(params[:id])
    end

    def update
        brand = Brand.find(params[:id])
        brand.update(brand_params)
        redirect_to brand_path(brand)
    end 

    def destroy
        brand = Brand.find(params[:id])
        brand.destroy
        redirect_to brands_path
    end 


    private

    def brand_params
        params.require(:brand).permit(:name, :owner, shoes_attributes: [:price, :color, :limited_edition])
    end 
end
