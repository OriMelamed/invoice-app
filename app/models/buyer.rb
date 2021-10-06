class Buyer < ApplicationRecord
    has_many :invoices

    validates :username, presence:true
end