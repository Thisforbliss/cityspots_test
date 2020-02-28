class HousesController < ApplicationController
    

    def new
        if params[:seller_id] && seller = Seller.find_by_id(params[:seller_id])
            @house = seller.houses.build
        else
            @house = House.new
        end
            
    end

    def index
        # byebug
        # if params[:seller_id]
        #     @seller = Seller.find(params[:seller_id])
        #     @seller_houses = @seller.houses  
            
        # else
            @seller = Seller.all
            @houses = House.all
            @expensive_houses = House.expensive
            
        # end
    
    end



    def create
        @house = current_user.houses.build(house_params)
        if @house.save
            redirect_to houses_path
        else
            render :new
        end
    end

    private

    def house_params
        params.require(:house).permit(:beds, :baths, :city, :state, :address, :price, :seller_id)
    end



 
end
