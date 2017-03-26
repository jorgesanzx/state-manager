class Vehicle < ApplicationRecord
  belongs_to :state

  validate :state_transition, on: :update

  private

  def state_transition
    state_id_before, state_id_after = state_id_change
    next_state_id = State.find(state_id_before).next_state_id
    if state_id_after != next_state_id
      next_state = State.find(next_state_id)
      errors.add(:state, "can only change to #{next_state.name}")
    end
  end
end
