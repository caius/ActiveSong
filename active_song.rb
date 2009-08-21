require "rubygems"
require "httparty"

class ActiveSong
  class Result < String
    def play!
      `say "#{self}"`
    end
  end


  include HTTParty

  API_KEY = "d406082d09a06db68-temporary.API.access"

  base_uri "http://lyricsfly.com/api/api.php"
  default_params :i => API_KEY

  def self.find params = {}
    params[:artist] ||= "%"
    params[:track] ||= "%"
    
    # Grab the right bit of the response
    result = get("", :query => {:a => encode_string(params[:artist]), :t => encode_string(params[:track])})["start"]["sg"].first["tx"]
    # Remove the crap lyricfly adds because we don't have a proper API key
    result.gsub!(/((weekly|limited|access|API|temporary|free|lyricsfly.com) ?){7}/, "")
    # Sort it out into a proper format
    result.gsub!("[br]", "\n").gsub!(/\n+/, "\n")
    # Grab the first 4 lines and return it as an ActiveSong::Result
    Result.new(result.split("\n")[0..3].join("\n"))
  end

protected

  def self.encode_string str
    str.gsub(/[^\w]/i, "%")
  end

end
