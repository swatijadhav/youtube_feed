require 'uri'
require 'faraday'
require 'nokogiri'
require 'open-uri'
require 'sax-machine'

module YoutubeFeed

  class Parser

    attr_accessor :youtube_feed_url

    def initialize(youtube_feed_url)
      @youtube_feed_url = youtube_feed_url
    end

    def fetch_and_parse
      response = Faraday.new(@youtube_feed_url).get
      YoutubeFeed::Atom.parse(response.body)
    end
  end

  class AtomEntry
    include SAXMachine
    element :"yt:videoId", as: :entry_id
    element :"yt:channelId", as: :channel_id
    element :title
    element :name, as: :author
    element :link, value: :href
    element :"media:description", as: :description
    element :published, as: :published_at
    element :"media:statistics", value: :views, as: :views_count
    element :"media:starRating", value: :average, as: :star_rating
    element :"media:thumbnail", value: :url, as: :thumbnail
  end

  class Atom
    include SAXMachine
    element :title do |title|
      title.strip
    end
    element :name, as: :author
    element :link, value: :href
    element :published, as: :published_at
    elements :entry, as: :entries, class: AtomEntry
  end

end
