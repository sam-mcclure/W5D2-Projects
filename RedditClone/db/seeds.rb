# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Sub.destroy_all

user1 = User.create({username: 'new_user', password: 'password' })
user2 = User.create({username: 'sam', password: 'password' })
user3 = User.create({username: 'nick', password: 'password' })

sub1 = Sub.create({title: 'dogs', description: 'the best', moderator_id: user2.id })
sub2 = Sub.create({title: 'cats', description: 'the best', moderator_id: user1.id })
sub3 = Sub.create({title: 'ferrets', description: 'the best', moderator_id: user3.id })

post1 = Post.create({title: 'Dog Training', url: "hgreighre", content: 'Tips for training', sub_id: sub1.id, author_id: user1.id})
post2 = Post.create({title: 'Dog Walking', url: "hgreniue", content: 'Help for dog walking', sub_id: sub1.id, author_id: user2.id})
post3 = Post.create({title: 'Cat Grooming', url: "hrthregerg", content: 'Tips for grooming', sub_id: sub2.id, author_id: user3.id})
post4 = Post.create({title: 'Ferret Tricks', url: "uireguiresg", content: 'Learn some tricks', sub_id: sub3.id, author_id: user3.id})

