# == Schema Information
#
# Table name: flims
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  url_slug    :string
#  year        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Flim < ApplicationRecord
	has_many :matches
  has_many :matched_flims, through: :matches, dependent: :destroy
  has_many :ratings

  # virtual atttibute
  attr_reader   :average_rating


  def average_rating

  	total_rating = ave_rating = 0

  	ratings = self.ratings.map(&:point) if self.ratings.size > 0 

  	# sum up value in the array
    if ratings != nil
    	 total_rating = ratings.inject(:+)
    	 ave_rating = ((total_rating / ratings.size) * 100).round  / 100.0
    end

    #
    return ave_rating
  end
end
