class SessionsController < ApplicationController

    def home
    end


    def new_seller
        @seller = Seller.new
        render :login
    end

    def new_buyer
        @buyer = Buyer.new
        render :login
    end

    def create_seller #login seller action and need to authenticate seller using .authenticate method
       @seller = Seller.find_by(:email => params[:seller][:email])
       if @seller && @seller.authenticate(params[:seller][:password])
            session[:seller_id] = @seller.id
            redirect_to houses_path(@seller)
        else
            flash[:error] = "Sorry, your username or password was incorrect"
            redirect_to login_path
        end
    end

 
    def fbcreate
        @seller = Seller.find_or_create_by(email: auth['extra']['raw_info']['email']) do |u|
          u.username = auth['extra']['raw_info']['name']
          u.email = auth['extra']['raw_info']['email']
          u.password = auth['uid']   # Secure Random Hex
        end
    
        session[:seller_id] = @seller.id
    
        redirect_to houses_path
      end
       

   
    def destroy
        if session[:email] == nil
            reset_session
            redirect_to root_path
        elsif current_user
            reset_session
            redirect_to root_path

        end
    end

    private

        def auth
        request.env['omniauth.auth']
        end
    end




#end
