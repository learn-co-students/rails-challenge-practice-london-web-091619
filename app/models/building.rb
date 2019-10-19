class Building < ApplicationRecord
  has_many :offices
  validates :name, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :rent_per_floor, presence: true
  validates :number_of_floors, presence: true

  def number_of_floors_available
    # Will not work until relationships and schema are corretly setup

    all_floors = Array(1..self.number_of_floors)
    self.offices.each do |office|
      all_floors.delete(office.floor)
    end
    all_floors
  end

  def empty_offices
    number_of_floors_available.map { |f| offices.build(floor: f) }
  end

  def total_rent
    offices.count * rent_per_floor
  end

  def available_floors
    floors = [*1..number_of_floors]
    floors.select {|floor| !used_floors.any?(floor) }
  end

  def used_floors
    offices.map {|office| office.floor}
  end

  def format_available_floors
    formatted = ''
    available_floors.each{|floor| formatted += floor.to_s + ' ' }
    formatted
  end

end
