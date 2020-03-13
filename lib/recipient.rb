require "httparty"

class Recipient

  attr_reader :slack_id, :name

  def initialize(slack_id:, name:)
    @slack_id = slack_id
    @name = name
  end

  #api endpoint https://api.slack.com/methods/chat.postMessage
  def send_message(msg_text)
    #send the message using HTTParty

    #deal with errors, if any
  end

  def details
    raise NotImplementedError, "Define this method in a child class"
  end

  # ------ Class Methods ------

  #this looks like it should be fetcher, based on the API's docs
  def self.get(url)
    #send message using HTTParty
    response = HTTParty.get(url, query: {token: ENV['SLACK_API_TOKEN']})

    #check for errors, if any
    if response.code != 200
      raise SlackAPIError, "We encountered a problem: #{response.body["error"]}"
    end

    return response
  end


  #this smells like a bigger factory method
  def self.list_all
    raise NotImplementedError, "Define this method in a child class"
  end

end

# This will be common to all the other files in the program
# so I'm including it here, where it will be accessible to each other class.
class SlackAPIError < Exception
end