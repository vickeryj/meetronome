class NoteController < ApplicationController
  def stop
    note = Note.find(@params[:id])
    note.stop
    @meeting = note.meeting
    redirect_to :controller => 'meeting', :action => 'show', :id => @meeting
  end
end
