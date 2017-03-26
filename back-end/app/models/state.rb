class State < ApplicationRecord
  has_many :vehicles, dependent: :nullify

  validate :next_state_id_has_to_reference_another_state

  private

  def next_state_id_has_to_reference_another_state
    return if next_state_id.nil?

    other_states_ids = State.where.not(id: id).pluck(:id)
    return if next_state_id.in?(other_states_ids)

    errors.add(:next_state_id, 'has to be nil or reference another state')
  end
end
