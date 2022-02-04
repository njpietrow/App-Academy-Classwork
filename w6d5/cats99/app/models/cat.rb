# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#
require 'action_view'

VALID_COLORS = %w(white black tuxedo orange calico maltese)

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: {in: VALID_COLORS, message: "Sorry, not a valid color."}

  def age 
    todays_date = Date.today 
    number_of_days = (todays_date - self.birth_date).to_i
    years = number_of_days / 365
  end

end
