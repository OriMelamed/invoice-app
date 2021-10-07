class BuyersController < ApplicationController

    def show
        @buyer = Buyer.find(params[:id])
    end

    def index
        @pagy, @buyers = pagy(Buyer.all, items:2)
    end

end
