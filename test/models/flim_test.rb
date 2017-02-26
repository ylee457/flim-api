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

require 'test_helper'

class FlimTest < ActiveSupport::TestCase
  
  test "Flim can be found from test database" do

  	f1 = Flim.find_by!(url_slug: 'Laartefacta')
    
    assert_equal('Laartefacta', f1.url_slug)
    assert_equal('La Artefacta', f1.title)
    
  end

  test "A Flim can be added for many related flims" do

  	f1 = Flim.find_by(url_slug: 'Laartefacta')

  	# added flims
    f2 = Flim.find_by(url_slug: '5BrokenCamera')
    f3 = Flim.find_by(url_slug: 'OscarsFandor')
    f4 = Flim.find_by(url_slug: 'PhoneCall')
    f5 = Flim.find_by(url_slug: 'AttheDiner')

    # add related flims 
    f1.matched_flims << f2
    f1.matched_flims << f3
    f1.matched_flims << f4
    
    assert_equal(3, f1.matched_flims.size)
    assert_includes f1.matched_flims, f3, "A flim should be included, but it is not."
    assert_not_includes f1.matched_flims, f5, "A flim should not be included, but it is."
    
  	
  end

  test "A Flim can have inverse relationship after added" do

  	f1 = Flim.find_by(url_slug: 'Laartefacta')
    f2 = Flim.find_by(url_slug: '5BrokenCamera')
    f3 = Flim.find_by(url_slug: 'OscarsFandor')
    f4 = Flim.find_by(url_slug: 'PhoneCall')
    f5 = Flim.find_by(url_slug: 'AttheDiner')
    f6 = Flim.find_by(url_slug: 'BlackHistoryMonth')
    
    f1.matched_flims << f2
    f1.matched_flims << f3
    f1.matched_flims << f4
    
    assert_equal(1, f2.matched_flims.size)
    assert f2.matched_flims.include?(f1), "A flim should be included, but it is not."
    assert f3.matched_flims.include?(f1), "A flim should be included, but it is not."
    assert f4.matched_flims.include?(f1), "A flim should be included, but it is not."
    assert_not f5.matched_flims.include?(f1), "A flim should not be included, but it is."
  	
  end
end
