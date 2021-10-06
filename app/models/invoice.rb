class Invoice < ApplicationRecord
    belongs_to :buyer

    validates :issue_date, presence: true
    validates :maturity_date, presence: true
    validates :amount, presence: true
    validates :vendor_name, presence: true
    validates :buyer_id, presence: true

    def self.search(search)
        if search
            @invoices = Invoice.where(["id LIKE ? ", "%#{search}%"])
        else
            all
        end
    end

end