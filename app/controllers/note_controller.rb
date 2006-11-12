class NoteController < ApplicationController
  def stop
    note = Note.find(@params[:id])
    note.stop
    @meeting = note.meeting
    redirect_to :controller => 'meeting', :action => 'view', :id => @meeting
  end
end
