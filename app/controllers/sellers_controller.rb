class SellersController < ApplicationController

    def new
        @seller = Seller.new
    end

    def create
        @seller = Seller.new(seller_params)
        if @seller.save
            session[:seller_id] = @seller.id
            redirect_to new_house_path
            #display errors with flash messages
        else
            render :new
        end
    end

    def show
        
     @seller = Seller.find_by(id: params[:id])
    end

    
    private

    def seller_params
        params.require(:seller).permit(:email, :username, :password)
    end

end
