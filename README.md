# Converting Feature Specs to Request Specs Workshop

## Setup

```sh
git clone git@github.com:bkiahstroud/devvit.git

cd devvit

bundle install

bundle exec rails db:create db:migrate db:seed
bundle exec rails s
```

Then, navigate to http://localhost:3000/.

## Branches

- main: Contains feature and request specs
- convert_specs: Contains feature specs, but no request specs.  Use this branch to try converting the feature specs to request specs
