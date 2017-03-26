require 'test_helper'

class VehiclesConfigurationsTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:designed)
  end

  test 'Requires authentication' do
    get vehicles_url

    assert_response :unauthorized
  end

  test 'List all vehicles' do
    get vehicles_url, headers: authenticated_user_header

    assert_response :success
  end

  test 'Retrieve a vehicle' do
    get vehicle_url(@vehicle), headers: authenticated_user_header

    assert_response :success
  end

  test 'Create a vehicle' do
    vehicle_params = { name: @vehicle.name, state_id: @vehicle.state_id }

    assert_difference('Vehicle.count') do
      post vehicles_url, params: { vehicle: vehicle_params }, headers: authenticated_user_header
    end

    assert_response :success
  end

  test 'Put vehicle to next state' do
    vehicle_params = { name: @vehicle.name, state_id: @vehicle.state.next_state_id }

    patch vehicle_url(@vehicle), params: { vehicle: vehicle_params }, headers: authenticated_user_header

    assert_response :success
  end

  test "Can't put vehicle to states different than next" do
    vehicle_params = { name: @vehicle.name, state_id: State.find_by(name: 'tested').id }

    patch vehicle_url(@vehicle), params: { vehicle: vehicle_params }, headers: authenticated_user_header

    assert_response :unprocessable_entity
  end
end
