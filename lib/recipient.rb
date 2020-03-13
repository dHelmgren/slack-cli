class Recipient

  attr_reader :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def send_message(msg_text)
  end

  def details
    raise NotImplementedError, "Define this method in a child class"
  end

  # ------ Class Methods ------

  def self.get(url, params)
  end

  def self.list_all
    raise NotImplementedError, "Define this method in a child class"
  end

end