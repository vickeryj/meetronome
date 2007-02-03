class MeetingController < ApplicationController

  def create
    @meeting = Meeting.new()
  end

  def save
    @meeting = Meeting.new(@params[:meeting])
    logger.debug(@params.to_s)
    if (@meeting.save)
      @meeting.start
      redirect_to :action => 'view', :id => @meeting
    else
      render :action => 'create'
    end
  end
  
  def view
    @meeting = Meeting.find(@params[:id])
    if request.xhr?
      render :update do |page|
             page.replace_html 'startcost', @meeting.cost.to_s
             page.replace_html 'notes', :partial => 'notes'
      end
      return
    end
    
  end

  def stop
    @meeting = Meeting.find(@params[:id])
    @meeting.stop
    redirect_to :action => 'view', :id => @meeting
  end

  def addNote
    @meeting = Meeting.find(@params[:meeting][:id])
    @meeting.stop_notes
    if @meeting.running?
      note = Note.new(@params[:newNote])
      note.meeting = @meeting
      if (note.descr != "")
        note.save
      end
    end
    redirect_to :action => 'view', :id => @meeting
  end
end
