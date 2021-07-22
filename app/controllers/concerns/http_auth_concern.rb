module HttpAuthConcern  
  extend ActiveSupport::Concern
  included do
      before_action :http_authenticate
  end
  def http_authenticate
    http_basic_authenticate_with name: "Jungle", password: "book"
  end
end