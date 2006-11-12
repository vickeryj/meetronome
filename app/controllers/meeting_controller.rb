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
    if request.xhr?
      render :update do |page|
             page.replace_html 'startcost', @meeting.cost.to_s
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
    note = Note.new(@params[:newNote])
    note.meeting = @meeting
    if (note.descr != "")
      note.save
    end
    redirect_to :action => 'view', :id => @meeting
  end
end
