class ObjectCannonGame < ActiveRecord::Base
  belongs_to :player
  belongs_to :game
  before_save :set_attributes
  private
    def set_attributes
      self.total_attributes = GenerateRandom.generate_attribute
    end
end

class GenerateRandom
  def self.generate_attribute
    (rand(5) + solve_chance.to_i).to_i
  end

  def self.solve_chance
    posibilites = get_posibilities
    two_more = search_chance(posibilites, 20)
    five_more = search_chance(posibilites, 10)
    ten_more = search_chance(posibilites, 5)
    twenty_more = search_chance(posibilites, 1)
    posibility = rand(100)
    if two_more.include?(posibility)
      return 2
    elsif five_more.include?(posibility)
      return 5
    elsif ten_more.include?(posibility)
      return 10
    elsif twenty_more.include?(posibility)
      return 20
    else
      return 0
    end
  end

  def self.search_chance(total_chance, values)
    result = []
    (1..200).map do |num|
      element = total_chance[rand(total_chance.count)]
      if !result.include?(element)
        result << element
      end
      break if result.count == values
    end
    result
  end

  def self.get_posibilities
    values = []
    (1..100).map{ |num| values << num }
    values
  end
end
