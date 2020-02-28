class ApplicationController < ActionController::Base
   
    private
    def current_user
            @current_user ||= Seller.find_by_id(session[:seller_id]) 
    end 

    def logged_in?
        !!session[:buyer_id] || !!session[:seller_id]
    end
end
