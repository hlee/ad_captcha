class HomeController < ApplicationController
  def index
    @users = User.all
  end
  
  def verify
    if params[:left].to_i > 173 && params[:left].to_i < 213  && params[:top].to_i > 123 && params[:top].to_i < 163
      render :text => 'ok'#params[:left] + "  " + params[:top]
    else
      render :text => 'problem'
    end
  end
end
