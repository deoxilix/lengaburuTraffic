class Weather
  attr_accessor :name, :crater_mod_index
  def initialize(name, crater_mod_index)
    @name = name
    @crater_mod_index = crater_mod_index
  end
end

SUNNY = Weather.new "Sunny", 0.9
WINDY = Weather.new "Windy", 1.1
RAINY = Weather.new "Rainy", 1
Weathers = [SUNNY, WINDY, RAINY]
