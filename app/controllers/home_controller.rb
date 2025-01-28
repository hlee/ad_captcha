class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :verify]
  skip_before_action :verify_authenticity_token, only: [:verify]

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
  
  def verify
    valid_drop = verify_drop_position(params[:top], params[:left])

    respond_to do |format|
      format.json do
        render json: { 
          status: valid_drop ? 'ok' : 'error',
          message: valid_drop ? 'Valid drop position' : 'Invalid drop position'
        }
      end
      format.turbo_stream do
        if valid_drop
          render turbo_stream: turbo_stream.replace(
            'drag-drop-demo',
            partial: 'drag_drop_success'
          )
        else
          render turbo_stream: turbo_stream.replace(
            'drag-drop-demo',
            partial: 'drag_drop_error'
          )
        end
      end
    end
  end

  private

  def verify_drop_position(top, left)
    top = top.to_i
    left = left.to_i
    
    # Define valid drop zone
    valid_top_range = (5..45)
    valid_left_range = (-275..-235)
    
    valid_top_range.include?(top) && valid_left_range.include?(left)
  rescue ArgumentError
    false
  end
end
