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
        @invoice = Invoice.find(params[:id])
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
        @invoice = Invoice.find(params[:id])
        if @invoice.update(params.require(:invoice).permit(:issue_date, :maturity_date, :amount, :vendor_name))
            flash[:notice]="Invoice editted succesusfully"
            redirect_to @invoice
        else
            render 'edit'
        end
    end

    def destroy
        @invoice = Invoice.find(params[:id])
        @invoice.destroy
        redirect_to invoices_path
    end
end