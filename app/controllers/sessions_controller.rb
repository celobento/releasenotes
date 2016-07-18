class SessionsController < ApplicationController
  def new
    
  end
  
  def signup
    @usuario = Usuario.new
  end
  
end
