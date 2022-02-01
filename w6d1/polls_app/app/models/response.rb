class Response < ApplicationRecord
  validate :respondent_already_answered?

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'
  
  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: 'User'
   
  has_one :question,
    through: :answer_choice,
    source: :question

  has_many :sibling_responses,
    through: :question,
    source: :responses

  def not_duplicate_response
    sibling_responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    unless sibling_responses.where('responses.user_id = ?',self.user_id).empty?
      errors[:respondent] << "User already answered!"
    end
  end

end
