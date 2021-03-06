# If using the gem, replace with:
#
# require 'rubygems'
# require 'james'
require File.expand_path '../../lib/james', __FILE__

require 'rubygems'
require 'barometer'

# Weather dialog by Florian Hanke.
#
# This is a very simple James example.
#
class WeatherDialog

  include James::Dialog

  def initialize location
    Barometer.config = { 1 => [:yahoo, :google], 2 => :wunderground }

    @barometer = Barometer.new location
  end

  hear 'How is the weather?' => :weather
  state :weather do
    hear ['How warm is it?', 'How cold is it?'] => ->(){ "It is #{@barometer.measure.current.temperature.celsius} degrees celsius" }
  end

end

James.use WeatherDialog.new('Melbourne')