class MeetingController < ApplicationController

  def new
    @meeting = Meeting.new()
  end

  def create
    @meeting = Meeting.new(params[:meeting])
    logger.debug(params.to_s)
    if (@meeting.save)
      @meeting.start
      session[:owner] = true
      cookies[:meetingowner] = {:value => @meeting.owner_cookie, :expires => 1.week.from_now}      
      redirect_to :action => 'show', :id => @meeting    
    else
      render :action => 'new'
    end
  end
  
  def show
    @meeting = Meeting.find_by_token(params[:id])
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


  #this should probably be moved to the index method in note controller but I am not sure how yet.
  def update_notes
    @meeting = Meeting.find_by_token(params[:id])
    
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
    @meeting = Meeting.find_by_token(params[:id])
    @meeting.stop if cookies[:meetingowner] == @meeting.owner_cookie
    redirect_to :action => 'show', :id => @meeting
  end

end
