# ActiveRecord Pg Extensions

This gem extends ActiveRecord's PostgreSQL adapter to support additional features in PostgreSQL.

## Features
### Supported

* [enums](https://www.postgresql.org/docs/9.6/static/datatype-enum.html)

### Upcoming
* Reflect on enum options to automatically map the enum in AR (see below)
* [referential integrity for Postgres arrays](https://www.postgresql.org/message-id/flat/CAJvoCut7zELHnBSC8HrM6p-R6q-NiBN1STKhqnK5fPE-9%3DGq3g%40mail.gmail.com#CAJvoCut7zELHnBSC8HrM6p-R6q-NiBN1STKhqnK5fPE-9=Gq3g@mail.gmail.com)

## Usage

The gem is automatically loaded within a Rails environment

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
