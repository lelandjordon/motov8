# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.destroy_all
Post.destroy_all
Author.destroy_all

authors = Author.create([
  {email:"demo1@mail.com", password:"demo1"},
  {email:"demo2@mail.com", password:"demo2"}
])

posts = Post.create([
  {title:"Men to the Moon", author: authors[0], body:"We do these things not because they are easy, but because they are hard."},
  {title:"Dan Daly", author: authors[1], body:"Come on, you sons of bitches!  Do you want to live forever?"}
])

comments = Comment.create([
  {title:"Inspiring", post: posts[0], author: authors[1], body:"He knew how to motivate us."},
  {title:"Devil dog", post: posts[1], author: authors[0], body:"OOHRAH.  Best damned Marine after Chesty."}
])
