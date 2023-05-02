class FsacarsController < ApplicationController
  before_action :authenticate_pilot!, except: :connect_client

  # http://fsacars.com/demo/userquery.php
  def connect_client
    return render body: 'NOUSR', layout: false unless strong_params[:auth].present?

    sign_in(Pilot.find_by(email: strong_params[:user]))

    return render body: 'NOUSR', layout: false unless current_pilot

    render body: 'USEROK', layout: false
  end

  private

  def strong_params
    params.permit(:auth, :user, :pass, :ver, :lat, :lon, :eqpt)
  end
end
