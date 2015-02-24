FactoryGirl.define do

    factory :user do
      email 'test@user.com'
      password 'chucknorris'
      first_name 'luis'
      last_name 'mendez'
      city 'Brooklyn'
      state 'NY'
      admin 'true'
    end

end
