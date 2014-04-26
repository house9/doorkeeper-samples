class Api::V1::Base < ::ApplicationController
  def doorkeeper_unauthorized_render_options
    {:json => {:error => "Not authorized"}}
  end

  # Find the user that owns the access token
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
