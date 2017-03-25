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
    get states_url, headers: authenticated_user_header

    assert_response :success
  end

  test 'Retrieve a state' do
    get state_url(@state), headers: authenticated_user_header

    assert_response :success
  end

  test 'Admin creates a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    assert_difference('State.count') do
      post states_url, params: { state: state_params }, headers: authenticated_admin_header
    end

    assert_response :success
  end

  test 'Regular user unauthorized to create a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    assert_no_difference('State.count') do
      post states_url, params: { state: state_params }, headers: authenticated_user_header
    end

    assert_response :unauthorized
  end

  test 'Admin updates a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    post states_url, params: { state: state_params }, headers: authenticated_admin_header

    assert_response :success
  end

  test 'Regular user unauthorized to update a state' do
    state_params = { name: @state.name, next_state_id: @state.next_state_id }

    post states_url, params: { state: state_params }, headers: authenticated_user_header

    assert_response :unauthorized
  end

  test 'Admin deletes a state' do
    assert_difference('State.count', -1) do
      delete state_url(@state), headers: authenticated_admin_header
    end

    assert_response :no_content
  end

  test 'Regular user unauthorized to delete a state' do
    assert_no_difference('State.count') do
      delete state_url(@state), headers: authenticated_user_header
    end

    assert_response :unauthorized
  end
end
