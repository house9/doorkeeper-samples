class Api::V1::ItemsController < Api::V1::Base
  doorkeeper_for :all
  respond_to :json

  def index
    respond_with current_resource_owner.items.order(:name)
  end
end
