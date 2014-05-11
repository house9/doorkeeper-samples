class AuthTokenSessionsController < ApplicationController
  def create
    logger.debug "----------------> #{current_user.email}"
    # raise "AuthTokenSessionsController#create"
    render text: params[:code]
  end

  def token
    if current_user
      # return the 'current' access token if user is still 'logged_on'
      application = Doorkeeper::Application.find_by(name: ENV['INTERNAL_APP_ONE_OAUTH_NAME'])

      access_token = Doorkeeper::AccessToken.find_or_create_for(application,
        current_user.id,
        "", # scopes,
        Doorkeeper.configuration.access_token_expires_in, # expires_in,
        true # use_refresh_token
      )

      render json: { token: access_token.token }
    else
      render json: { error: "Access Denied" }, status: 401
    end
  end
end
