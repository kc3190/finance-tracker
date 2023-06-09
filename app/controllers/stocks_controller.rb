class StocksController < ApplicationController 
    protect_from_forgery except: :search
    def search 
        if params[:stock].present? 
            @stock = Stock.new_lookup(params[:stock])
            if @stock 
                # # byebug
                respond_to do |format|
                    format.html
                    format.js { render partial: 'users/result' }
                end
                # render 'users/my_portfolio'
            else 
                flash[:alert] = "Please enter a valid symbol to search"
                redirect_to my_portfolio_path 
            end
        else 
            flash[:alert] = "Please enter a symbol to search" 
            redirect_to my_portfolio_path 
        end 
    end 
end 