# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
  { email: 'user@example.com', password: 'userpassword', role: 'user' },
  { email: 'admin@example.com', password: 'adminpassword', role: 'admin' }
])

State.create(name: 'tested')
State.create(name: 'painted', next_state_id: State.find_by(name: 'tested').id)
State.create(name: 'assembled', next_state_id: State.find_by(name: 'painted').id)
State.create(name: 'designed', next_state_id: State.find_by(name: 'assembled').id)
