require 'test_helper'

class StatesConfigurationsTest < ActionDispatch::IntegrationTest
  setup do
    @state = states(:tested)
  end

  test 'Requires authentication' do
    get states_url

    assert_response :unauthorized
  end

  test 'List all states' do
    get states_url, headers: authenticated_header

    assert_response :success
  end

  test 'Retrieve a state' do
    get state_url(@state), headers: authenticated_header

    assert_response :success
  end

  test 'Create a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    assert_difference('State.count') do
      post states_url, params: { state: state_params }, headers: authenticated_header
    end

    assert_response :success
  end

  test 'Update a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    post states_url, params: { state: state_params }, headers: authenticated_header

    assert_response :success
  end

  test 'Delete a state' do
    assert_difference('State.count', -1) do
      delete state_url(@state), headers: authenticated_header
    end

    assert_response :no_content
  end
end
