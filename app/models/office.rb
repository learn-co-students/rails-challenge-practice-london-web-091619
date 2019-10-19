class Office < ApplicationRecord
    belongs_to :company
    belongs_to :building
    validates :floors, numericality: {only_integer: true }
end
