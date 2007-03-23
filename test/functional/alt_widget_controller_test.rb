require File.dirname(__FILE__) + '/../test_helper'
require 'alt_widget_controller'

# Re-raise errors caught by the controller.
class AltWidgetController; def rescue_action(e) raise e end; end

class AltWidgetControllerTest < Test::Unit::TestCase
  def setup
    @controller = AltWidgetController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
