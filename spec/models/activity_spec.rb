require 'spec_helper'

describe Activity do
  describe '#timespan' do
    it 'returns a Timespan value object representing the span of time between the activity start and end' do
      activity = Activity.new(
        start_hour: 8, start_minute: 30,
        end_hour: 9, end_minute: 15)

      expected_timespan = Timespan.new(TimeOfDay.new(8,30), TimeOfDay.new(9,15))
      activity.timespan.should eq(expected_timespan)
    end
  end

  describe '#timespan=' do
    it 'sets the Timespan' do
      activity = Activity.new(
        start_hour: 8, start_minute: 30,
        end_hour: 9, end_minute: 15)

      timespan = Timespan.new(TimeOfDay.new(11,30), TimeOfDay.new(12,15))
      activity.timespan = timespan

      activity.start_hour.should eq(11)
      activity.start_minute.should eq(30)
      activity.end_hour.should eq(12)
      activity.end_minute.should eq(15)
    end
  end

  describe '#duration' do
    it 'is the duration between the start and end times' do
      activity = Activity.new(
        start_hour: 8, start_minute: 30,
        end_hour: 9, end_minute: 15)
      activity.duration.should eq(Duration.minutes(45))
    end
  end

  describe '#overlaps?' do
    it 'determines if two activities overlap' do
      activity1 = Activity.new(
        start_hour: 8, start_minute: 0,
        end_hour: 9, end_minute: 0)
      activity2 = Activity.new(
        start_hour: 8, start_minute: 30,
        end_hour: 9, end_minute: 30)
      activity3 = Activity.new(
        start_hour: 9, start_minute: 0,
        end_hour: 10, end_minute: 0)

      activity1.overlaps?(activity2).should be_true
      activity2.overlaps?(activity1).should be_true
      activity2.overlaps?(activity3).should be_true
      activity3.overlaps?(activity2).should be_true
      activity1.overlaps?(activity3).should be_false
    end
  end
end