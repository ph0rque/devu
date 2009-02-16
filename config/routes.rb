ActionController::Routing::Routes.draw do |map|

  map.site_search  'search', :controller => 'front', :action => 'search'
  map.root :controller => 'front', :action => 'index'

  map.test_execution '/code_test/execute/:id', :controller => 'code_tests', :action => 'execute'
  map.code_execution '/code_solution/execute/:id', :controller => 'code_solutions', :action => 'execute'
  
  Hobo.add_routes(map)

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
