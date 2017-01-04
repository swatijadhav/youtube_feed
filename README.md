# YoutubeFeed

Youtube RSS feed is customized with their own elements(prefixed with 'yt-').

This gem will parse youtube rss feed url and fetch feeds in standard rss format.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtube_feed'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youtube_feed

## Usage

    # any youtube playlist rss url / user videos rss url / channel videos rss url
    # url = https://www.youtube.com/feeds/videos.xml?playlist_id=PLwj9AQsvgODeGN2ZFEKQq15kDXwz8bnll
    
    feed = YoutubeFeed::Parser.new(url).fetch_and_parse
    
    feed.entries # returns an array of Entry objects
    # => [<YoutubeFeed::AtomEntry ...>, <YoutubeFeed::AtomEntry ...>, ...]
    
    
These entry objects contain the data parsed from the feed XML:

        entry = feed.entries.first
        entry.link
        # => "http://www.youtube.com/watch?v=Lip-XpO3WIA"
        entry.title
        # => "Announcing verison 1.0"
        entry.description
        # => "Amazon Go will prompt retailers to rethink the checkout experience,...."
        entry.author
        # => "L2inc"
        entry.thumbnail
        # => "https://i1.ytimg.com/vi/Lip-XpO3WIA/hqdefault.jpg"
        entry.entry_id
        # => "Lip-XpO3WIA"
        entry.channel_id
        # => "UCBcRF18a7Qf58cCRy5xuWwQ"
        entry.published_at
        # => "2016-12-30T19:49:45+00:00"
        entry.star_rating
        # => "4.96"
        entry.views_count
        # => "64885"

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

