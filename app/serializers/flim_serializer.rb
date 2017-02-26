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

class FlimSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :url_slug, :year, :average_rating

  has_many :matched_flims
  has_many :ratings

end
