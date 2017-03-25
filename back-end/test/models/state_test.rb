require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid when next_state_id is nil' do
    state = states(:painted)
    state.next_state_id = nil
    assert state.valid?
  end

  test 'valid when next_state_id references another state' do
    state = states(:painted)
    state.next_state_id = states(:tested)
    assert state.valid?
  end

  test 'invalid when next_state_id references itself' do
    state = states(:painted)
    state.next_state_id = state.id
    assert state.invalid?
  end

  test 'invalid when next_state_id references an non-existing state' do
    state = states(:painted)
    state.next_state_id = 0
    assert state.invalid?
  end
end
