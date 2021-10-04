class InvoicesController < ApplicationController

    before_action :set_invoice, only: [:show, :edit, :update, :destroy]

    def show
        @buyer = Buyer.find(params[:id])
    end

    def index
        @invoices = Invoice.paginate(page: params[:page], per_page: 2)
    end

    def new
        @invoice = Invoice.new
    end
    
    def edit
    end

    def create
        @invoice  = Invoice.new(invoice_params)
        @invoice.buyer = Buyer.first 
        if @invoice.save
            flash[:notice]="Invoice create succesusfully"
            redirect_to @invoice
        else
            render 'new'
        end
    end

    def update
        if @invoice.update(invoice_params)
            flash[:notice]="Invoice editted succesusfully"
            redirect_to @invoice
        else
            render 'edit'
        end
    end

    def destroy
        @invoice.destroy
        redirect_to invoices_path
    end

    private

    def set_invoice
        @invoice = Invoice.find(params[:id])
    end

    def invoice_params
        params.require(:invoice).permit(:issue_date, :maturity_date, :amount, :vendor_name)
    end

end