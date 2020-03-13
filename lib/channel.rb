require_relative "recipient"

class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize( topic:, member_count:, name:, slack_id:)
    super(slack_id: slack_id, name: name)
    @topic = topic
    @member_count = member_count
  end

  def details
  end

  #------ Class Methods ------

  #api endpoint https://api.slack.com/methods/conversations.list
  def self.list_all
  end

end