class Observation < ActiveRecord::Base
  attr_accessible :datetime, :dewpoint, :temperature, :windspeed
end
