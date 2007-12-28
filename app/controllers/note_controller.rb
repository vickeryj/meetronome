class NoteController < ApplicationController
  def stop
    @meeting = Meeting.find_by_token(params[:meeting_id])
    
    note = @meeting.notes.find(params[:id])
    note.stop
    @meeting = note.meeting
    redirect_to :controller => 'meeting', :action => 'show', :id => @meeting
  end
  
  def create
    @meeting = Meeting.find_by_token(params[:meeting_id])
    @meeting.stop_notes
    if @meeting.running?
      note = Note.new(params[:note])
      note.meeting = @meeting
      if (note.descr != "")
        note.save
      end
    end
    redirect_to @meeting
  end
  
  def index
    @meeting = Meeting.find_by_token(params[:meeting_id])
    
    render :update do |page|
      if (@meeting.stopped? and (Time.now - @meeting.stopped_at) < 300)
        page << "window.location.reload()"
      elsif (@meeting.changed_in_minute?)
        page.replace_html 'notes', :partial => 'notes'
      end
    end
    return
  end
  
end
