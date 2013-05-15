module RMeetup2

  class Request
    
    def initialize( model)
      @model = model
      @params = {:key => RMeetup2::Client.api_key}
    end

    def execute
      response = Nestful.get("https://api.meetup.com/2/#{@model}?key=#{ @params[:key]}")
      # http response available in : response.status
      return JSON.parse(response.body)["results"]
    end

  end
end
