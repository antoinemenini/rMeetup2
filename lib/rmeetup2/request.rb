module RMeetup2

  class Request
    @@models = {
      :categories => '2/categories',
      :checkins => '2/checkins',
      :cities => '2/cities',
      :events => '2/events',
      :open_events => '2/open_events',
      :groups => '2/groups',
      :groups3 => 'find/groups',
      :topics => 'topics',
      :members => '2/members',
      :rsvps => '2/rsvps'
    }
        
    def initialize(model, params = {})
      @model = @@models[model]
      @params = params
      @params[:key] = RMeetup2::Client.api_key
    end

    def execute
      param_str = @params.map{|k,v| "#{k.to_s}=#{v}"}.join('&')
      response = Nestful.get("https://api.meetup.com/#{@model}?#{param_str}")
      # http response available in : response.status
      return JSON.parse(response.body)["results"]
    end

  end
end
