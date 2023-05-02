class FsacarsController < ApplicationController
  before_action :authenticate_pilot!, except: :connect_client

  def connect_client
    return render body: 'NOUSR', layout: false unless strong_params[:auth].present?

    render body: sign_in_pilot? ? 'USEROK' : 'NOUSR', layout: false
  end

  private

  def sign_in_pilot?
    pilot = Pilot.find_by!(email: strong_params[:user])

    sign_in(pilot) && pilot.valid_password?(strong_params[:pass])
  rescue ActiveRecord::RecordNotFound => err
    Rails.logger.error(err)
    false
  end

  def strong_params
    params.permit(:auth, :user, :pass, :ver, :lat, :lon, :eqpt)
  end
end
