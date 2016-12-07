module LengaburuMaps
  Available_vehicles = []
  Available_orbits = []
  Time_records = {}

  Vehicle_Preference = [
  ]

  def LengaburuMaps.verify_vehicles (current_weather)
    Available_vehicles.map!{|vehicle| vehicle if vehicle.viable_weathers.include? (current_weather) }.compact!
  end

  def calculate_time
    Available_orbits.each{|orbit|
      Available_vehicles.each{|vehicle|
        vehicle_time = {}
        vehicle_time[vehicle] = (orbit.distance / vehicle.modify_speed(orbit) + orbit.craters * vehicle.crater_time)
      }
      Time_records[orbit] = vehicle_time
    }
  end

  def evaluate_fastest_combination
  end
end
