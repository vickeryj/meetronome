class MeetingController < ApplicationController

  def create
    @meeting = Meeting.new()
  end

  def save
    @meeting = Meeting.new(@params[:meeting])
    if (@meeting.save)
      @meeting.start
      redirect_to :action => 'view', :id => @meeting
    else
      render :action => 'create'
    end
  end
  
  def view
    @meeting = Meeting.find(@params[:id])
  end

  def stop
    @meeting = Meeting.find(@params[:id])
    @meeting.stop
    redirect_to :action => 'view', :id => @meeting
  end
end
