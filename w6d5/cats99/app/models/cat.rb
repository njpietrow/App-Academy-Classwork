require 'action_view'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :birth_date, presence: true

  def age 
    todays_date = Date.today 
    number_of_days = (todays_date - self.birth_date).to_i
    years = number_of_days / 365
  end
end
