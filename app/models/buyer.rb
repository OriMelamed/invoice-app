class Buyer < ApplicationRecord
    validates :username, presence:true

    has_many :invoices
end