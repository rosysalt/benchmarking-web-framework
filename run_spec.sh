APPS=(rack-app cuba roda rack hanami-router nancy)

for app in ${APPS[@]}; do
  export TESTING_APP=$app
  bundle exec rspec
done
