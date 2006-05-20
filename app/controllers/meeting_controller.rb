class MeetingController < ApplicationController

  def create
    @meeting = Meeting.new()
  end

  def save
    @meeting = Meeting.new(@params[:meeting])
    if (@meeting.save)
      flash[:notice] = "New Meeting Created"
      redirect_to :action => 'view'
    else
      render :action => 'edit'
    end
  end
  
  def view
  end

  def start
    @paused = false; 
    render :action => 'view'
  end

  def stop
    @paused = true; 
    render :action => 'view'
  end
end
