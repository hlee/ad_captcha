class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def verify
    if params[:top].to_i > 5 && params[:top].to_i < 45  && params[:left].to_i > -275 && params[:left].to_i < -235
      render :text => 'ok'#params[:left] + "  " + params[:top]
    else
      render :text => 'problem'
    end
  end
end
