APPS=(rack-app cuba roda rack hanimi-router)

for app in ${APPS[@]}; do
  export TESTING_APP=$app
  bundle exec rspec
done
