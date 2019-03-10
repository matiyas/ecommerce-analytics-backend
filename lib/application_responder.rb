class ApplicationResponder < ActionController::Responder
  # Redirects resources to the collection path (index action) instead
  # of the resource path (show action) for POST/PUT/DELETE requests.
  # include Responders::CollectionResponder

  protected

  def json_resource_errors
    {
      errors: resource.errors
    }
  end
end
