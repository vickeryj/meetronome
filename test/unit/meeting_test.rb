require File.dirname(__FILE__) + '/../test_helper'

class MeetingTest < Test::Unit::TestCase
  fixtures :meetings

  def test_valid
    m = Meeting.new
    assert !m.valid?
    m.name="Some Meeting"
    m.dollars_per_hour=10
    assert m.valid?
    m = meetings(:valid_meeting)
    assert m.valid?
  end
end
