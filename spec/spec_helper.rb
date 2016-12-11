require 'rspec'

Dir["./models/**/*.rb"].each {|klass| require klass }

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
