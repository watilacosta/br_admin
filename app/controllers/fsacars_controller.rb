class FsacarsController < ApplicationController
  before_action :authenticate_pilot!

  # http://fsacars.com/demo/userquery.php
  def connect_client
    return 'NOUSR' unless strong_params[:auth].present?

    sign_in(Pilot.find_by(email: strong_params[:user]))

    return 'NOUSR' unless current_pilot

    'USEROK'
  end

  private

  def strong_params
    params.permit(:auth, :user, :pass, :ver, :lat, :lon, :eqpt)
  end
end
