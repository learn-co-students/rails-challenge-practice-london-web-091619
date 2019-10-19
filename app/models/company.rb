class Company < ApplicationRecord
    has_many :employees
    has_many :offices
    validates :name, presence: true

    def total_rent
        offices.sum {|office| office.building.rent_per_floor}
    end
end
