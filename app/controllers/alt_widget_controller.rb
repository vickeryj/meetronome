class AltWidgetController < ApplicationController
  #verify :xhr => true
  def show
    meeting = Meeting.find_by_token(params[:meeting_id])
    alt = AltWidget.find_random()
    render :update do |page|
      alt.render(meeting, page, :alternative)
    end
  end
end
