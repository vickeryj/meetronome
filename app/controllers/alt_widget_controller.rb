class AltWidgetController < ApplicationController
  #verify :xhr => true
  def view
    meeting = Meeting.find(params[:meeting_id])
    alt = AltWidget.find_random()
    render :update do |page|
      alt.render(meeting, page, :alternative)
    end
  end
end
