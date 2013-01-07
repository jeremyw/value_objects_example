require 'spec_helper'

describe Timespan do
  def time_of_day(hour, minute=0)
    TimeOfDay.new hour, minute
  end

  describe '#duration' do
    it 'returns a Duration value object' do
      timespan = Timespan.new(time_of_day(8), time_of_day(8, 30))
      timespan.duration.should eq(Duration.minutes(30))
    end
  end

  describe '#overlaps?' do
    it 'determines if two timespans overlap' do
      timespan1 = Timespan.new(time_of_day(8), time_of_day(9))
      timespan2 = Timespan.new(time_of_day(8, 30), time_of_day(9, 30))
      timespan3 = Timespan.new(time_of_day(9), time_of_day(10))

      timespan1.overlaps?(timespan2).should be_true
      timespan2.overlaps?(timespan3).should be_true
      timespan1.overlaps?(timespan3).should be_false
    end
  end
end