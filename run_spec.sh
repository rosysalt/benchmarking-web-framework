APPS=(hobbit rack-app cuba roda rack hanami-router nancy)

for app in ${APPS[@]}; do
  export TESTING_APP=$app
  bundle exec rspec spec/v1
done

for app in (hobbit rack-app) do
  export TESTING_APP=$app
  bundle exec rspec spec/v0
done
