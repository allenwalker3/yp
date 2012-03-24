require "yp/version"
require "faraday"
require "faraday_middleware"
require "json"

module Yp

  # Yp::Client.new(api_key: "YOUR_API_KEY")
  
  class Client
    API_URL = "http://api2.yp.com"

    SEARCH_PATH = "listings/v1/search"
    DETAILS_PATH = "listings/v1/details"

    def initialize(options={})
      @api_key = options[:api_key]
    end

    # e.g. client.search(searchloc: "94109", term: "kayak")
    # http://api2.yp.com/listings/v1/search
    def search(options={})
      response = connection.get do |req|
        req.url SEARCH_PATH, options
      end

      JSON.parse(response.body)['searchResult']['searchListings']['searchListing']
    end

    # e.g. client.details("30624356")
    # http://api2.yp.com/listings/v1/details?listingid=30624356&key=xxxxxxxxxx
    def details(listingid)
      response = connection.get do |req|
        req.url DETAILS_PATH, {listingid: listingid}
      end

      JSON.parse(response.body)['listingsDetailsResult']['listingsDetails']['listingDetail'][0]
    end

    private

    def connection
      params = {}
      params[:key] = @api_key if @api_key
      params[:format] = "json"

      conn = Faraday.new(url: "#{API_URL}", params: params) do |builder|
        builder.use Faraday::Request::UrlEncoded  # convert request params as "www-form-urlencoded"
        builder.use Faraday::Adapter::NetHttp     # make http requests with Net::HTTP
      end
    end


  end
end


