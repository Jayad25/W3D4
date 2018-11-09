# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  u1 = User.create!(username: 'TrumpLovers48')
  u2 = User.create!(username: 'BirdisTheWord')

  p1 = Poll.create!(title: 'Personality Questions', user_id: u1.id)
  p2 = Poll.create!(title: 'Political Questions', user_id: u2.id)

  q1 = Question.create!(body: 'What is your favorite color?', poll_id: p1.id)
  q2 = Question.create!(body: 'What car defines you?', poll_id: p1.id)

  a1 = AnswerChoice.create!(text: 'Green', question_id: q1.id)
  a2 = AnswerChoice.create!(text: 'Red', question_id: q1.id)
  a3 = AnswerChoice.create!(text: 'Black', question_id: q1.id)
  a4 = AnswerChoice.create!(text: 'Blue', question_id: q1.id)

  a5 = AnswerChoice.create!(text: 'Honda Civic', question_id: q2.id)
  a6 = AnswerChoice.create!(text: 'Tesla Model S', question_id: q2.id)
  a7 = AnswerChoice.create!(text: 'Subaru WRX STI', question_id: q2.id)
  a8 = AnswerChoice.create!(text: 'a shopping cart', question_id: q2.id)

  r1 = Response.create!(user_id: u2.id, question_id: q1.id, answer_id: a4.id)
  r2 = Response.create!(user_id: u2.id, question_id: q2.id, answer_id: a6.id)
end
