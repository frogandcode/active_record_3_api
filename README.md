# ActiveRecord3Api

Allows Rails 2 applications using Rails >= 2.3.8 to make use of the newer Active Record 3 query interface in Rails 3 (implemented using Rails 2 named scopes). The following finder methods have been ported:

```
where (:conditions)
having (:conditions)
select
group
order
limit
offset
joins
includes (:include)
lock
readonly
from
```

## Installation

Add this line to your application's Gemfile:

    gem 'active_record_3_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_record_3_api

## Usage

In your Rails 2 application, replace queries like this:

    Client.all :conditions => ["orders_count = ?", params[:orders]]

with the Active Record 3-style:

    Client.where("orders_count = ?", params[:orders]).all

All of the finder methods above have been implemented, though some edge cases may not be handled.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
