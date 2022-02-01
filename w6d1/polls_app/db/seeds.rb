# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Response.destroy_all
AnswerChoice.destroy_all
Question.destroy_all
Poll.destroy_all
User.destroy_all


user1 = User.create!(username: "nickp1")
user2 = User.create!(username: "bobc2")
user3 = User.create!(username: "chrisr3")

poll1 = Poll.create!(author_id: 1, title: "Best Food")
poll2 = Poll.create!(author_id: 1, title: "Favorite Sport")
poll3 = Poll.create!(author_id: 2, title: "Best TA")
poll4 = Poll.create!(author_id: 3, title: "Best Pizza Topping")

question1 = Question.create!(poll_id: 1, question_text: "Which is your favorite food")
question2 = Question.create!(poll_id: 1, question_text: "Which is your second favorite food")
question3 = Question.create!(poll_id: 2, question_text: "Which is your favorite sport")
question4 = Question.create!(poll_id: 3, question_text: "Who is your favorite instructor")
question5 = Question.create!(poll_id: 4, question_text: "Which is the best pizza topping")

answer_choice1 = AnswerChoice.create!(question_id: 1, answer_text: "Pizza") 
answer_choice2 = AnswerChoice.create!(question_id: 1, answer_text: "Burgers")
answer_choice3 = AnswerChoice.create!(question_id: 2, answer_text: "Ice Cream")
answer_choice4 = AnswerChoice.create!(question_id: 2, answer_text: "Popsicles")
answer_choice5 = AnswerChoice.create!(question_id: 3, answer_text: "Basketball")
answer_choice6 = AnswerChoice.create!(question_id: 3, answer_text: "Soccer")
answer_choice7 = AnswerChoice.create!(question_id: 4, answer_text: "Taylor")
answer_choice8 = AnswerChoice.create!(question_id: 4, answer_text: "Paulo")
answer_choice9 = AnswerChoice.create!(question_id: 5, answer_text: "Cheese")
answer_choice10= AnswerChoice.create!(question_id: 5, answer_text: "Pepperoni")

response1 = Response.create!(user_id: 1, answer_choice_id: 1)
response2 = Response.create!(user_id: 1, answer_choice_id: 3)
response3 = Response.create!(user_id: 1, answer_choice_id: 5)
response4 = Response.create!(user_id: 1, answer_choice_id: 7)
response5 = Response.create!(user_id: 1, answer_choice_id: 9)
response6 = Response.create!(user_id: 2, answer_choice_id: 2)
response7 = Response.create!(user_id: 2, answer_choice_id: 4)
response8 = Response.create!(user_id: 2, answer_choice_id: 6)
response9 = Response.create!(user_id: 2, answer_choice_id: 8)
response10= Response.create!(user_id: 2, answer_choice_id: 10)
response11= Response.create!(user_id: 3, answer_choice_id: 2)
response12= Response.create!(user_id: 3, answer_choice_id: 4)
response13= Response.create!(user_id: 3, answer_choice_id: 6)
response14= Response.create!(user_id: 3, answer_choice_id: 8)
response15= Response.create!(user_id: 3, answer_choice_id: 10)
# responseFAIL = Response.create!(user_id: 1, answer_choice_id: 2)