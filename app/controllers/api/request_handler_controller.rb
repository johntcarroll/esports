class Api::RequestHandlerController < ApplicationController
  # Callbacks
  before_action :authenticate
  # END Callbacks

  # Exception Handling
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::StandardError, with: :error_occurred
  # END Exception Handling

  # Callback Methods
  def authenticate # TODO: Figure out how to write tests so that I can run this through command line 
  #   authenticate_or_request_with_http_token do |token, _|
      # User.find_by(token: token)
    # end
    return true
  end
  # END Callback Methods

  protected
  # Error Handlers
  def record_not_found(e) # error handler
    respond({}, true, e, 404)
  end

  def error_occurred(e) # error handler
    respond({}, true, e, 500)
  end
  # END Error Handlers

  def current_user
    @current_user ||= authenticate
  end


  def respond( payload = {}, error = false, msg = '', status = 200) # end point for all api calls
    render :json => {'error' => error, 'error_msg' => msg, 'payload' => payload}, :status => status
  end
end
