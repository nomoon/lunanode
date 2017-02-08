# Lunanode

A basic implementation of the [Luna Node API](https://wiki.lunanode.com/index.php/API) for Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "lunanode"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lunanode

## Usage

The class is instantiated by either passing it a JSON file containing the keys `api_id` and `api_key`, or specifying the ID and key directly:
```
  api = Lunanode::API.new("credentials_file.json")
  api = Lunanode::API.new(api_id: "ABCDEFG", api_key: "HIJKLMNOP")
```

Once instantiated, action methods follow the example:

```
  api.vm_list # no parameters
  api.vm_info(vm_id: "My-VM-ID") # required parameters
  api.image_list(region: "Toronto") # optional parameters
```

More information is available in the documentation, available online at [rubydoc.info](http://www.rubydoc.info/github/nomoon/lunanode).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nomoon/lunanode. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
