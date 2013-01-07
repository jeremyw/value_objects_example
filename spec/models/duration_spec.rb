require 'spec_helper'

describe Duration do
  describe '.seconds' do
    it 'constructs a Duration for the given number of minutes' do
      Duration.seconds(1800).should eq(Duration.new(1800))
    end
  end

  describe '.minutes' do
    it 'constructs a Duration for the given number of minutes' do
      Duration.minutes(30).should eq(Duration.new(1800))
    end
  end

  describe '#seconds' do
    it 'is the number of seconds' do
      Duration.new(1800).seconds.should eq(1800)
    end
  end

  describe '#minutes' do
    it 'is the number of minutes' do
      Duration.new(1800).minutes.should eq(30)
    end
  end

  describe '#hours' do
    it 'is the number of hours' do
      Duration.new(5400).hours.should eq(1.5)
    end
  end
end