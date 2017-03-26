require 'test_helper'

class VehicleTest < ActiveSupport::TestCase
  test 'valid when put to next state' do
    vehicle = vehicles(:designed)
    vehicle.state = states(:assembled)
    assert vehicle.valid?
  end

  test 'invalid when put to a state different from next' do
    vehicle = vehicles(:designed)
    vehicle.state = states(:tested)
    assert vehicle.invalid?
  end
end
