# Lunanode

[![Build Status](https://travis-ci.org/nomoon/lunanode.svg?branch=master)](https://travis-ci.org/nomoon/lunanode)
[![Code Climate](https://codeclimate.com/github/nomoon/lunanode/badges/gpa.svg)](https://codeclimate.com/github/nomoon/lunanode)
[![Dependency Status](https://gemnasium.com/badges/github.com/nomoon/lunanode.svg)](https://gemnasium.com/github.com/nomoon/lunanode)
[![Gem Version](https://badge.fury.io/rb/lunanode.svg)](https://badge.fury.io/rb/lunanode)

A basic implementation of the [Luna Node API](https://wiki.lunanode.com/index.php/API) for Ruby.
**Unofficial and unsupported by the people at [Luna Node](https://lunanode.com).**

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
