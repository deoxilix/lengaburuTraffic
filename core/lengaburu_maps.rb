module LengaburuMaps
  Available_vehicles = []
  Available_orbits = []
  VehicleRoutePairs = []

  Vehicle_Precedence = [
    "Bike",
    "TukTuk",
    "SuperCar"
  ]

  def LengaburuMaps.eval
    calculate_time
    evaluate_fastest_pair
    fastest_preffered_pair
  end

=begin

  LengaburuMaps.update_available_vehicles, updates the vehicles list available to LengaburuMaps,
  in the given Weather conditions.

=end

  def LengaburuMaps.update_available_vehicles (current_weather)
    Available_vehicles.select!{|vehicle| vehicle.viable_weathers.include? (current_weather) }
  end

=begin

  LengaburuMaps.update_orbits updates all the Orbits'
    :traffic_speed => from realtime input data
    :craters => from given weather conditions

=end

  def LengaburuMaps.update_orbits (orbit_meta, current_weather)
    Available_orbits.find{|orbit| orbit.name == orbit_meta.first }.traffic_speed = orbit_meta[-2].to_i
    Available_orbits.each{|orbit| orbit.weathering (current_weather) }
  end

  private

=begin

  Calculates time required for each Vehicle:Orbit pair
  And saves it into a tree: for later evaluation_of_fastest_pair

=end

  def self.calculate_time
    Available_orbits.each{|orbit|
      vehicle_time_pairs = []
      Available_vehicles.each{|vehicle|
        vehicle_time_pairs << ( [] << vehicle.name << (orbit.distance / vehicle.modify_speed(orbit).to_f + orbit.craters * vehicle.crater_time) )
      }
      VehicleRoutePairs << ( [] << orbit.name << vehicle_time_pairs )
    }
  end

=begin

  

=end

  def self.evaluate_fastest_pair
    [*0...VehicleRoutePairs.count].each do |p|
      VehicleRoutePairs[p][1] = VehicleRoutePairs.dig(p, 1).min_by(&:last)
      VehicleRoutePairs[p].flatten!
    end

    VehicleRoutePairs.sort_by!(&:last)
  end

  def self.fastest_preffered_pair
    if VehicleRoutePairs.size > 1
      VehicleRoutePairs.sort_by!{|combination| Vehicle_Precedence.index(combination.last) }
    end

    "Vehicle #{VehicleRoutePairs.first[-2]} on #{VehicleRoutePairs.first.first}, ETA: #{VehicleRoutePairs.first.last} hours."
  end
end
