module RequestHandler
  extend ActiveSupport::Concern
  included do
    before_action :authenticate
    rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ::StandardError, with: :error_occurred
  end

  def authenticate # TODO: Figure out how to write tests so that I can run this through command line
  #   authenticate_or_request_with_http_token do |token, _|
      # User.find_by(token: token)
    # end
    return true
  end

  def error_occurred(e) # error handler
    respond({}, true, e, 500)
  end

  def record_not_found(e) # error handler
    respond({}, true, e, 404)
  end

  def respond( payload = {}, error = false, msg = '', status = 200) # end point for all api calls
    render :json => {'error' => error, 'error_msg' => msg, 'payload' => payload}, :status => status
  end
end
