require 'nestful'
require 'rubygems'
require 'json'
require '/rmeetup2/request.rb'

module RMeetup2

  class Client

    def self.api_key
      @@api_key
    end

    def self.api_key=(k)
      @@api_key = k
    end

  end
end
