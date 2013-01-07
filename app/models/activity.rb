class Activity < ActiveRecord::Base
  attr_accessible :description,
    :start_hour, :start_minute,
    :end_hour, :end_minute

  validates :start_hour, :end_hour, presence: true
  validates :description, length: { in: 1..140 }

  def timespan
    Timespan.new(
      time_of_day(start_hour, start_minute),
      time_of_day(end_hour, end_minute))
  end
  delegate :duration, to: :timespan

  def timespan=(timespan)
    self[:start_hour]   = timespan.start_time_of_day.hour
    self[:start_minute] = timespan.start_time_of_day.minute
    self[:end_hour]     = timespan.end_time_of_day.hour
    self[:end_minute]   = timespan.end_time_of_day.minute
  end

  def overlaps?(other)
    timespan.overlaps?(other.timespan)
  end

  private

  def time_of_day(hour, minute)
    TimeOfDay.new(hour, minute)
  end
end