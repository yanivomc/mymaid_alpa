namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  make_users
  make_professionals
  make_relationships
  end
end

def make_users
  admin = User.create!(first_name:     "Yaniv",
                       last_name:      "Cohen",
                       email:    "yanivomc@gmail.com",
                       password: "q1w2p0o9!",
                       password_confirmation: "q1w2p0o9!")
  #admin.toggle!(:admin)
  99.times do |n|
    first_name  = Faker::Name.first_name
    last_name   = Faker::Name.first_name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(first_name:     first_name,
                 last_name:      last_name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end



    def make_professionals
    Professional.create!(first_name:     "Yaniv",
                           last_name:   "Cohen",
                          email:    "yanivc@plimus.com",
                           password: "q1w2p0o9!",
                           password_confirmation: "q1w2p0o9!")
      #admin.toggle!(:admin)
      99.times do |n|
        first_name  = Faker::Name.first_name
        last_name   = Faker::Name.first_name
        email = "example-#{n+1}@railstutorial.org"
        password  = "password"
        Professional.create!(first_name:     first_name,
                     last_name:      last_name,
                     email:    email,
                     password: password,
                     password_confirmation: password)
      end
    end




def make_relationships
  users = User.all
  professionals = Professional.all
  user  = users.first
  followed_users = professionals[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end





