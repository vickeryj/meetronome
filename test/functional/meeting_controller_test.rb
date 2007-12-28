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

  def test_create
    get :new
    assert_response :success
  end

  def test_create
    post :create, :meeting => { :cents_per_hour => 1000, :name => "foobar"}
    assert_redirected_to :action => "show"
  end
end
