ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  #this probably needs some work
  #map.connect 'accept/invite/:invite[token]', :action => 'signup', :controller => 'account'
  
  #this is terrible and needs to be fixed.  the meeting controller has ugly method names
  map.connect '', :controller => 'meeting', :action => 'create'
  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id'
end
