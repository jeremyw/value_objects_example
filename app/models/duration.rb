Duration = Struct.new(:seconds) do
  def self.seconds(seconds)
    Duration.new(seconds)
  end

  def self.minutes(minutes)
    Duration.new(minutes * 60)
  end

  def minutes
    seconds / 60.0
  end

  def hours
    minutes / 60
  end
end