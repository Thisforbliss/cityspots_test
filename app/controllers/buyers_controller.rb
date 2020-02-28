class BuyersController < ApplicationController
    
    def new
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(buyer_params)
        if @buyer.save
            session[:buyer_id] = @buyer.id
            redirect_to houses_path
        else
            render :new
        end
    end
    
    private

    def buyer_params
        params.require(:buyer).permit(:email, :first_name, :last_name, :phone_number, :password)
    end
end
