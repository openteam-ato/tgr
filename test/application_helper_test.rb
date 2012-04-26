# encoding: utf-8

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @event = Hashie::Mash.new
  end

  test "interval helper: 22 марта 2012" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-22T00:00:00+07:00"
    assert_equal interval_for(@event), "22 марта 2012"
  end

  test "interval helper: 08:00 22 марта, 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T08:00:00+07:00"
    assert_equal interval_for(@event), "08:00 22 марта 2012"
  end

  test "interval helper: 08:00 - 12:00 22 марта, 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T12:00:00+07:00"
    assert_equal interval_for(@event), "08:00 &mdash; 12:00 22 марта 2012"
  end

  test "interval helper: 08:00 22 марта, 2012 (without end time)" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T23:59:00+07:00"
    assert_equal interval_for(@event), "08:00 22 марта 2012"
  end

  test "interval helper: 08:00 22 марта - 08:00 23 марта, 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T08:00:00+07:00"
    assert_equal interval_for(@event), "08:00 22 марта &mdash; 08:00 23 марта 2012"
  end

  test "interval helper: 08:00 22 марта - 12:00 23 марта, 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T12:00:00+07:00"
    assert_equal interval_for(@event), "08:00 22 марта &mdash; 12:00 23 марта 2012"
  end

  test "interval helper: 08:00 22 марта - 23 марта, 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T00:00:00+07:00"
    assert_equal interval_for(@event), "08:00 22 марта &mdash; 23 марта 2012"
  end

  test "interval helper: 22 марта - 24 марта, 2012" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-24T00:00:00+07:00"
    assert_equal interval_for(@event), "22 марта &mdash; 24 марта 2012"
  end

  test "interval helper: 22 марта - 24 марта, 2012 (with 23:59)" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-24T23:59:00+07:00"
    assert_equal interval_for(@event), "22 марта &mdash; 24 марта 2012"
  end

  test "interval helper: 22 марта - 12:00 22 апреля, 2012" do
    @event.since = "2012-03-22t00:00:00+07:00"
    @event.until = "2012-04-22T10:00:00+07:00"
    assert_equal interval_for(@event), "22 марта &mdash; 10:00 22 апреля 2012"
  end

  test "interval helper: 22 марта - 22 апреля, 2012 (with 23:59)" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-04-22T23:59:00+07:00"
    assert_equal interval_for(@event), "22 марта &mdash; 22 апреля 2012"
  end

end
