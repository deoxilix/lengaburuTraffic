# [Lengaburu Traffic:](https://www.geektrust.in/coding-problem/backend/traffic)
![](https://www.geektrust.in/assets/images/problem-set3-1-popup.jpg)
image: (c) [GeekTrust](www.geektrust.in)
- - -
## Problem Context
King Shan wants to visit the suburb of Hallitharam, and has 2 possible orbits and 3 possible vehicles to chose from. The coding challenge is to determine which orbit and vehicle King Shan should take to reach Hallitharam the fastest.

Goal: to go from Silk Dorb to Hallitharam in the shortest time possible.

#### [Orbit options:](https://github.com/deoxilix/LengaburuTraffic/models/orbit.rb)
+ **Orbit 1 :** 18 mega miles & 20 craters to cross
+ **Orbit 2 :** 20 mega miles & 10 craters to cross
#### [Vehicle options:](https://github.com/deoxilix/LengaburuTraffic/models/vehicle.rb)
+ **Bike :** 10 megamiles/hour & takes 2 min to cross 1 crater
+ **TukTuk :** 12 mm/hour & takes 1 min to cross 1 crater
+ **SuperCar :** 20 mm/hour & takes 3 min to cross 1 crater
#### [Weather options:](https://github.com/deoxilix/LengaburuTraffic/models/weather.rb)
+ **Sunny :** craters reduce by 10%. Car, bike and tuktuk can be used in this weather.
+ **Windy :** craters increase by 20%. Car and tuktuk can be used in this weather.
+ **Rainy :**  no change to number of craters. All vehicles can be used in this weather.

#### [Sample Input :](https://github.com/deoxilix/LengaburuTraffic/input.txt)
 Weather is Sunny
 Orbit1 traffic speed is 12 megamiles/hour
 Orbit2 traffic speed is 10 megamiles/hour

#### Sample Output :
Vehicle TukTuk on Orbit1

#### Usage :
```ruby
bundle install
ruby lengaburu_traffic_controller.rb
```

#### Dependencies :
+ [`rspec`](https://github.com/rspec/rspec)

#### Environment :
```
    ruby - version: ruby 2.3.1p112 (2016-04-26) [x86_64-linux-gnu]
```
