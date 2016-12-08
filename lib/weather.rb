class Weather
  attr_accessor :name, :crater_mod_index
  def initialize(name, crater_mod_index)
    @name = name
    @crater_mod_index = crater_mod_index
  end

  module Types
    SUNNY = Weather.new "Sunny", 0.9
    WINDY = Weather.new "Windy", 1.0
    RAINY = Weather.new "Rainy", 1.1
    ALL = Weather::Types.constants.map {|c| Weather::Types.const_get(c)}
  end
end
