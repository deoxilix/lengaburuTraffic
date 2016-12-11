=begin

  LengaburuMaps is an abstraction majorly wrapping Orbits and Vehicles,

  while being rooted into the Lengaburu_Traffic_Controller, updates itself with realtime information,

  when regulated by the Lengaburu_Traffic_Controller it can deduce the Fastest_Vehicle_Orbit_Pairs,

  thereby solving the fundamental problem of LengaburuTraffic.

=end

require "pry"

module LengaburuMaps

  Vehicle_Precedence = [
    "Bike",
    "TukTuk",
    "SuperCar"
  ]

  @fastest_vehicle_orbit_pairs = Hash.new() {|h,k| h[k] = [] }



  def self.evaluate( available_vehicles, available_orbits )
    record_vehicle_orbit_time(available_vehicles, available_orbits)

    evaluate_preferred_pair( evaluate_fastest_pair )
    display
  end



=begin
  :update_available_vehicles

    This updates the vehicles list available to LengaburuMaps,
    in the given Weather conditions.

=end
  def update_vehicle_availability(available_vehicles, current_weather)
    available_vehicles.select!{|vehicle| vehicle.viable_weathers.include? (current_weather) }
  end



=begin

  LengaburuMaps.update_orbits updates all the Orbits'
    :traffic_speed => from realtime input data
    :craters => from given weather conditions

=end
  def update_orbit(available_orbits, orbit_meta, current_weather)
    orbit_name = orbit_meta.first
    orbit_traffic_speed = orbit_meta[-2].to_i

    orbit = available_orbits.find{|orbit| orbit.name == orbit_name }

    orbit.update_traffic_speed (orbit_traffic_speed)
    orbit.weathering (current_weather)
  end

  private
=begin

  :record_vehicle_orbit_time

    This is responsible for Calculating the time required for each Vehicle:Orbit pair.
    And saves it into a hash: for later evaluation_of_fastest_pair

=end
  def self.record_vehicle_orbit_time(available_vehicles, available_orbits)
    @fastest_vehicle_orbit_pairs.clear

    available_orbits.each{|orbit|
      available_vehicles.each{|vehicle|
        @fastest_vehicle_orbit_pairs[vehicle.estimate_trip_time(orbit)] << ([] << orbit.name << vehicle.name)
      }
    }
    binding.pry
  end



=begin

  :evaluate_fastest_pair

    This is responsible for evaluation of the VehicleOrbitPairs,
    in order to figure out the @fastest_vehicle_orbit_pairs.

=end
  def self.evaluate_fastest_pair
    lowest_time = @fastest_vehicle_orbit_pairs.min.first
    @fastest_vehicle_orbit_pairs.select!{|time| time == lowest_time }
    lowest_time
  end



=begin

  :evaluate_preferred_pair

    This is responsible for evaluation

=end
  def self.evaluate_preferred_pair(lowest_time)
    if @fastest_vehicle_orbit_pairs.first.last.size > 1
      @fastest_vehicle_orbit_pairs[lowest_time].sort_by!{|combination| Vehicle_Precedence.index(combination.last) }
    end

    @fastest_vehicle_orbit_pairs[lowest_time] = @fastest_vehicle_orbit_pairs[lowest_time].shift
  end



=begin



=end
  def self.display
    time, pair = @fastest_vehicle_orbit_pairs.first
    "Vehicle #{pair.last} on #{pair.first}, ETA: #{time} hours.\n"
  end
end
