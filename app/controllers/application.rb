class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # :secret => 'fd13657c7d7dc6e2615cc166935d59a2'
end

class CodeTestsController < ApplicationController
  hobo_model_controller
  auto_actions :all
end

class CodeSolutionsController < ApplicationController
  hobo_model_controller
  auto_actions :all, :except => :index
  auto_actions_for :code_test, [:index, :new, :create]
end

class TestFrameworksController < ApplicationController
  hobo_model_controller
  auto_actions :all, :except => :show
end

class UsersController < ApplicationController
  hobo_user_controller
  auto_actions :all, :except => [ :index, :new, :create ]
end

class FrontController < ApplicationController
  hobo_controller
  def index; end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end
end