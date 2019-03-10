require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder

  # ActionController::API doesn't have respond_to method. It can be obtained
  # from ActionController::MimeResponds module.
  include ActionController::MimeResponds

  # Inform devise that it can respond to JSON requests.
  respond_to :json
end
