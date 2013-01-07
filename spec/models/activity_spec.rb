require 'spec_helper'

describe Activity do
  describe '#start_time_of_day' do
    it 'is the number of seconds since midnight when the activity starts' do
      activity = Activity.new(start_hour: 8, start_minute: 30)
      activity.start_time_of_day.should eq(510)
    end
  end

  describe '#end_time_of_day' do
    it 'is the number of seconds since midnight when the activity ends' do
      activity = Activity.new(end_hour: 9, end_minute: 30)
      activity.end_time_of_day.should eq(570)
    end
  end

  describe '#duration_in_minutes' do
    context 'when start time is before end time' do
      it 'is the number of minutes between the start and end times' do
        activity = Activity.new(
          start_hour: 8, start_minute: 30,
          end_hour: 9, end_minute: 15)
        activity.duration_in_minutes.should eq(45)
      end
    end
  end

  describe '#duration_in_hours' do
    it 'is the number of hours between the start and end times' do
      activity = Activity.new(
        start_hour: 8, start_minute: 0,
        end_hour: 16, end_minute: 15)
      activity.duration_in_hours.should eq(8.25)
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
      activity2.overlaps?(activity3).should be_true
      activity1.overlaps?(activity3).should be_false
    end
  end
end