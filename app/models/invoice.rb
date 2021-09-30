class Invoice < ApplicationRecord
    validets :issue_date, presence: true
    validates :maturity_date, presence: true
    validates :amount, presence: true
    validates :vendor_name, presence: true
end