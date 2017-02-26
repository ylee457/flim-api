# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  flim_id         :integer
#  matched_flim_id :integer
#

class Match < ApplicationRecord
	belongs_to :flim
  belongs_to :matched_flim, class_name: "Flim"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_match_options)
  end

  def inverses
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { matched_flim_id: flim_id, flim_id: matched_flim_id }
  end
end
