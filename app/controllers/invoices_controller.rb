class InvoicesController < ApplicationController
    def show
    end

    def index
        @invoice = Invoice.all
    end
end