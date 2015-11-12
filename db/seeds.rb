# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = FactoryGirl.create(:user)
u2 = FactoryGirl.create(:user)

q = u.questions.create(title:'Question', content:'What day is today?')
q.save!

a = q.responses.build(user: u, respondable: q, content: 'I am an answer', answer:true)
a.save!

c2 = q.responses.build(user: u, respondable: q, content: 'I am a comment on the question')
c2.save!

c = a.responses.build(user:u2, respondable: a, content: 'Comment on answer')
c.save!



