require File.dirname(__FILE__) + '/../test_helper'
require 'meeting_controller'

# Re-raise errors caught by the controller.
class MeetingController; def rescue_action(e) raise e end; end

class MeetingControllerTest < Test::Unit::TestCase
  def setup
    @controller = MeetingController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
