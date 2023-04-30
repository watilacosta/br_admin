class DovController < ApplicationController
  before_action :authenticate_pilot!
end
