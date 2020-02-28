class House < ApplicationRecord
    belongs_to :seller
    belongs_to  :buyer, optional: true
    scope :expensive, -> { where("price > ?", "100000" )}
end
