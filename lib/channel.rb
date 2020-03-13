require_relative "recipient"

class Channel < Recipient

  attr_reader :topic, :member_count

  def initialize( topic:, member_count:, name:, slack_id:)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count
  end

  def details
  end

  def self.list_all
  end

end