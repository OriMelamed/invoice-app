class Invoice < ApplicationRecord
    validates :issue_date, presence: true
    validates :maturity_date, presence: true
    validates :amount, presence: true
    validates :vendor_name, presence: true
    validates :buyer_id, presence: true

    belongs_to :buyer

    def self.search(search)
        if search
            @invoices = Invoice.where(["id LIKE ? ", "%#{search}%"])
        else
            all
        end
    end

end