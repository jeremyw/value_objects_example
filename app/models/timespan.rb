Timespan = Struct.new(:start_time_of_day, :end_time_of_day) do
  def duration
    @duration ||= Duration.new(end_time_of_day.second_of_day - start_time_of_day.second_of_day)
  end

  def range
    @range ||= (start_time_of_day...end_time_of_day)
  end

  def overlaps?(other)
    range.cover?(other.start_time_of_day) || other.range.cover?(start_time_of_day)
  end
end