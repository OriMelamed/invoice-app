class Invoice < ApplicationRecord
    validates :issue_date, presence: true
    validates :maturity_date, presence: true
    validates :amount, presence: true
    validates :vendor_name, presence: true
end