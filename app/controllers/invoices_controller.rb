class InvoicesController < ApplicationController
    before_action :set_buyer, only: [:show, :index, :edit, :update, :destroy]
    before_action :set_invoice, only: [:show, :edit, :update, :destroy]

    def show
        @buyer = Buyer.find(params[:buyer_id])
    end

    def index
        @pagy, @invoices = pagy(@buyer.invoices.search(params[:search]), items: 2)
    end

    def new
        @invoice = @buyer.invoices.new
    end
    
    def edit
    end

    def create
        @buyer = Buyer.find(params[:buyer_id])
        @invoice  = @buyer.invoice.new(invoice_params)
        if @invoice.save
            flash[:notice]="Invoice create succesusfully"
            redirect_to @buyer
        else
            render 'new'
        end
    end

    def update
        if @invoice.update(invoice_params)
            flash[:notice]="Invoice editted succesusfully"
            redirect_to @buyer
        else
            render 'edit'
        end
    end

    def destroy
        @invoice.destroy
        redirect_to buyer_invoices_path
    end

    private

    def set_invoice
        @invoice = @buyer.invoices.find(params[:id])
    end
    
    def set_buyer
        @buyer = Buyer.find(params[:buyer_id])
    end

    def invoice_params
        params.require(:invoice).permit(:issue_date, :maturity_date, :amount, :vendor_name)
    end

end