class BuyersController < ApplicationController

    def show
        @buyer = Buyer.find(params[:id])
    end

    def index
        @buyers = Buyer.all
    end

end