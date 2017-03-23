# Conderaction

[![Circle CI](https://circleci.com/gh/sprucemail/conderaction.png?style=shield&circle-token=55b18893cfc9e61d96670bf41c3496e2bce21302)](https://circleci.com/gh/sprucemail/conderaction)
[![Code Climate](https://codeclimate.com/repos/5422f047e30ba04f2400133d/badges/732d9a461037fbfbb90a/gpa.svg)](https://codeclimate.com/repos/5422f047e30ba04f2400133d/feed)

## A simple implementation of DCI that specifically targets Ruby on Rails.
Do it for the life of the object or only for the life of a block of code.

Conderaction is inspired by Jim Gay's [casting](https://github.com/saturnflyer/casting) gem but provides a Rails-specific twist to DCI.

Here's a quick example that you might try in a Rails project:

```ruby
# implement a module that contains information for the request response
# and apply it to an object in your system.
def show
  respond_with user.as(UserRepresenter)
end
```

To use proper delegation, your approach should preserve `self` as a reference
to the original object receiving a method. When the object receiving the forwarded
message has its own and separate notion of `self`, you're working with a wrapper (also called
consultation) and not using delegation.

The Ruby standard library includes a library called "delegate", but it is
a consultation approach. With that "delegate", all messages are forwarded to
another object, but the attendant object maintains its own identity.

With Conderaction, your defined methods may reference `self` and during
execution it will refer to the original client object.

## Installation

If you are using Bundler, add this line to your application's Gemfile:

```ruby
gem 'conderaction'
```

Or install it yourself as:

    $ gem install conderaction

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Built by [CrowdOx](https://crowdox.com)
