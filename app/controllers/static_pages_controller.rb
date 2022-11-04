class StaticPagesController < ApplicationController 
  before_action :authenticate_user!, except: [:index]

  def index 
  end

  def authenticated
  end

end