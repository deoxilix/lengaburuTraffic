=begin

    :Weather

      is a PORO, when instantiated

      it allows the :LengaburuMaps to estimate_trip_time, more precisely

      by simulating the implications, expected with :current_weather of Lengaburu.

=end
class Weather
  attr_accessor :name, :crater_mod_index
  def initialize(name, crater_mod_index)
    @name = name
    @crater_mod_index = crater_mod_index
  end
end
