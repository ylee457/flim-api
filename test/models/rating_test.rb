# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  point      :integer          default(0)
#  flim_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
