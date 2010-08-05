ActionController::Routing::Routes.draw do |map|
  map.root :controller => "products", :action => 'new'
  map.resources :products
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
