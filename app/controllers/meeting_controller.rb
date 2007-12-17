class MeetingController < ApplicationController

  def create
    @meeting = Meeting.new()
  end


  def save
    @meeting = Meeting.new(params[:meeting])
    logger.debug(params.to_s)
    if (@meeting.save)
      @meeting.start
      session[:owner] = true
      cookies[:meetingowner] = {:value => @meeting.owner_cookie, :expires => 1.week.from_now}      
      redirect_to :action => 'view', :token => @meeting.token    
    else
      render :action => 'create'
    end
  end
  
  def view
    @meeting = Meeting.find_by_token(params[:token])
    #if flash[:setcookie]
    #  cookies[:meetingowner] = {:value => @meeting.owner_cookie, :expires => 1.week.from_now}
    #end
    session[:owner] = true if cookies[:meetingowner] == @meeting.owner_cookie
    
    if request.xhr?
      render :update do |page|
             page.replace_html 'startcost', @meeting.cost.to_s
      end
      return
    end
  end


  
  def update_notes
    @meeting = Meeting.find(params[:id])
    
    render :update do |page|
      if (@meeting.stopped? and (Time.now - @meeting.stopped_at) < 300)
        page << "window.location.reload()"
      elsif (@meeting.changed_in_minute?)
        page.replace_html 'notes', :partial => 'notes'
      end
    end
    return
  end


  def stop
    @meeting = Meeting.find(params[:id])

    @meeting.stop if cookies[:meetingowner] == @meeting.owner_cookie
    redirect_to :action => 'view', :id => @meeting
  end

  def addNote
    @meeting = Meeting.find(params[:meeting][:id])
    @meeting.stop_notes
    if @meeting.running?
      note = Note.new(params[:newNote])
      note.meeting = @meeting
      if (note.descr != "")
        note.save
      end
    end
    redirect_to :action => 'view', :id => @meeting
  end
end
