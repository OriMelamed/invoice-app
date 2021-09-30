class InvoicesController < ApplicationController
    def show
        @invoice = Invoice.find(params[:id])
    end

    def index
        @invoices = Invoice.all
    end

    def new
        @invoice = Invoice.new
    end
    
    def edit
    end

    def create
        @invoice  = Invoice.new(params.require(:invoice).permit(:issue_date, :maturity_date, :amount, :vendor_name))
        if @invoice.save
            flash[:notice]="Invoice create succesusfully"
            redirect_to @invoice
        else
            render 'new'
        end
    end

    def update
    end

    def destroy
    end
end