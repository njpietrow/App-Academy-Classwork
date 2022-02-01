class Question < ApplicationRecord
  validates :question_text, presence: true

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :responses,
    through: :answer_choices,
    source: :responses

end
