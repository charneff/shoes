module ShoesHelper

    def display_limited_edition
        if @shoe.limited_edition
            content_tag(:h3, "Limited Edition")
        else
            content_tag(:h4, "Ordinary" )
        end
    end

    def display_header
        if @brand 
            tag.h2("All the #{@brand.name} Shoes")
        else
            tag.h1("All the Shoes")
        end 
    end 

    def display_brand_fields(t)
        if params[:brand_id]
            t.hidden_field :brand_id
        else
            render partial: 'brand_select', locals: {f: t}
        end 
    end 

    def display_nested_header
        if params[:brand_id]
            "Create a new #{@brand.name} shoe"
        else
            "Create New Shoe"
        end 

    end 
end
