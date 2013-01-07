class Activity < ActiveRecord::Base
  MINUTES_PER_DAY = 1440

  attr_accessible :description,
    :start_hour, :start_minute,
    :end_hour, :end_minute

  validates :start_hour, :end_hour, presence: true
  validates :description, length: { in: 1..140 }

  def start_time_of_day
    start_hour * 60 + start_minute
  end

  def end_time_of_day
    end_hour * 60 + end_minute
  end

  def duration_in_minutes
    end_time_of_day - start_time_of_day
  end

  def duration_in_hours
    duration_in_minutes / 60.0
  end

  def overlaps?(other)
    range = (self.start_time_of_day...self.end_time_of_day)
    range.cover?(other.start_time_of_day) || range.cover?(other.end_time_of_day)
  end
end