u = User.create(:email => 'zhubert@gmail.com', :password => 'foobar', :username => 'zhubert')

foo = 0
25.times do
  sleep 1 # so we can sort
  u.posts.create(:title => "Post #{foo.to_i}", :content => "#{Faker::Lorem.paragraph(5)}")
  foo = foo + 1
end

foo = 0
first_post = Post.first
25.times do
  sleep 1
  first_post.comments.create(:content => "Comment #{foo.to_i} #{Faker::Lorem.paragraph(5)}")
  foo = foo + 1
end