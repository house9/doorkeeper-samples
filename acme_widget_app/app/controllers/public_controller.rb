class PublicController < ApplicationController
  def index
    logger.debug " ----------------- "
    logger.debug ENV['OAUTH_ID']
    logger.debug ENV['OAUTH_SECRET']
    logger.debug ENV['KEEPER_URL']
    logger.debug " ----------------- "
  end

  def not_signed_in
  end
end
