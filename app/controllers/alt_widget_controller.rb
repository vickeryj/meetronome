class AltWidgetController < ApplicationController
  #verify :xhr => true
  def view
    #only a proof of concept
    #this should probably be done by passing 
    #some resource to the model and let the model 
    #do so rjs or something
    
    meeting = Meeting.find(params[:meeting_id])
    s = AltWidget.find_random()[0].calculate_alternative(meeting)
    render :update do |page|
      #instead pass page to calculate_alternative or another one 
      #called render alternative or something
      page.replace_html :alternative, s
    end
  end
end
