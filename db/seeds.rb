# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# for testing purpose, I assume you had loaded the fixture data into the development database by 
# this command: rake db:fixtures:load FIXTURES=flims

f1 = Flim.find_by(url_slug: 'Laartefacta')

# added flims
f2 = Flim.find_by(url_slug: '5BrokenCamera')
f3 = Flim.find_by(url_slug: 'OscarsFandor')
f4 = Flim.find_by(url_slug: 'PhoneCall')
f5 = Flim.find_by(url_slug: 'AttheDiner')
f6 = Flim.find_by(url_slug: 'BlackHistoryMonth')

# add related flims 
f1.matched_flims << f2 if !f1.matched_flims.include?(f2)
f1.matched_flims << f3 if !f1.matched_flims.include?(f3)
f1.matched_flims << f4 if !f1.matched_flims.include?(f4)

f2.matched_flims << f4 if !f2.matched_flims.include?(f4)
f2.matched_flims << f5 if !f2.matched_flims.include?(f5)

f3.matched_flims << f5 if !f3.matched_flims.include?(f5)
f3.matched_flims << f6 if !f3.matched_flims.include?(f6)
f3.matched_flims << f4 if !f3.matched_flims.include?(f4)


# creating rating
r1 = Rating.create(point: 3, flim_id: f1.id)
r2 = Rating.create(point: 5, flim_id: f1.id)
r3 = Rating.create(point: 2, flim_id: f1.id)
r4 = Rating.create(point: 4, flim_id: f1.id)
r5 = Rating.create(point: 1, flim_id: f1.id)

r6= Rating.create(point: 5, flim_id: f2.id)
r7 = Rating.create(point: 3, flim_id: f2.id)
r8 = Rating.create(point: 1, flim_id: f2.id)
