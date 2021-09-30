class InvoicesController < ApplicationController
    def show
        @invoice = Invoice.find(params[:id])
    end

    def index
        @invoices = Invoice.all
    end

    def new
    end

    def create
        @invoice  = Invoice.new(params.require(:invoice).permit(:issue_date, :maturity_date, :amount, :vendor_name))
        @invoice.save
        redirect_to @invoice
    end
end