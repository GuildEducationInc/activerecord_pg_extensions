# ActiveRecord Pg Extensions

This gem extends ActiveRecord's PostgreSQL adapter to support additional features in PostgreSQL.

## Features
### Supported

* [enums](https://www.postgresql.org/docs/9.6/static/datatype-enum.html)

## Usage

The gem is automatically loaded within a Rails environment.

### Enums

Two methods are added to AR migrations to create and remote enums:

```ruby
class ExampleARMigration < ActiveRecord::Migration[5.1]
  def up
    create_enum :vehicles, 'car', 'bus', 'train', 'plane'
  end

  def down
    drop_enum :vehicles
  end
end
```

The column will present itself as a String column by default. To map it to an ActiveRecord enum, use the [hash syntax](http://api.rubyonrails.org/v5.1/classes/ActiveRecord/Enum.html):

```ruby
class MyModel < ActiveRecord::Base
  enum vehicles: {
    car: 'car',
    bus: 'bus',
    train: 'train',
    plane: 'plane'
  }
end
```

## Deploying a New Gem Version
Read this [guide](https://docs.github.com/en/free-pro-team@latest/packages/guides/configuring-rubygems-for-use-with-github-packages) first on the general approach.

Note: It is recommended that you test changes to this gem and by using
`guild-tuition` in order to guarantee your changes will work with the only
known consumer.

### Prerequisites:

- You will need a personal access token through github
- Github PAT is installed properly in the `~/.gem/credentials` file.
- Run `bundle exec appraisal install` to check if things are working
  when it comes to dependencies.
- PR with changes has been merged, including changes to the `lib/activerecord_pg_extensions/version.rb` file.

Once that is done, follow these steps:
1. Your current git branch is `main`.
2. Run `gem build activerecord_pg_extensions.gemspec`. Verify it creates a gem
   file in the current folder with the new version appended in step (2).
3. Push the newly created gem up to the github package repository. Here is the
   command to do this:
```sh
gem push --key github \
--host https://rubygems.pkg.github.com/GuildEducationInc \
activerecord_pg_extensions-1.2.0.gem
```
