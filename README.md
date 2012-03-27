# Yp

Simple Ruby wrapper to yp.com api. 

## Installation

Add this line to your application's Gemfile:

    gem 'yp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yp

## Usage

Acquire an api key by registering at http://developer.yp.com

```ruby
client = Yp::Client.new(api_key: YOUR_API_KEY)
```

To do a search:

```ruby 
results = c.search(searchloc: ZIP_CODE, term: SEARCH_TERM, listingcount: 50, sort: 'distance')
```
This returns an array of hashes. See http://developer.yp.com/api/Listings%2520Endpoints/Search for the attribute keys.

To do a details listing lookup, you will need this listing id, presumably found using the search api above.

```ruby
detail = c.details(LISTING_ID_STRING)
businessName = detail['businessName']
```

This returns a hash with attribute/value pairs. See http://http://developer.yp.com/api/Listings%2520Endpoints/Details

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
