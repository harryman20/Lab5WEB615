# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..50
  name = Faker::Name.name
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.first_name = first_name
  user.last_name = last_name
  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
    for ii in 1..50
      article = Article.new
      article.user = user
      article.title = Faker::Lorem.paragraph
      article.content = Faker::Lorem.paragraph
      if article.save
        p "Saved article ##{i}: #{name} (#{email})"
        for ii in 1..50
          comment = Comment.new
          comment.user = user
          comment.article = article
          comment.message = Faker::Lorem.paragraph
          if article.save
            p "Comment ##{ii} saved for #{name}"
          else
            p article.errors
          end
        end
      end
    end
  else
    p user.errors
  end
end