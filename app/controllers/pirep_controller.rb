class PirepController < ApplicationController
  include PirepParams

  def new
    @pirep = Pirep.new(
      pilot: user,
      orig: icao(permitted_params[:lat1], permitted_params[:lon1]),
      dest: icao(permitted_params[:lat2], permitted_params[:lon2]),
      eqpt: permitted_params[:aircraft],
      hours: permitted_params[:blocktime],
      pirep: permitted_params[:pirep]
    )

    binding.pry
  end

  private

  def user
    Pilot.find_by(email: permitted_params[:user])
  end

  def icao(lat, lon)
    lat = 1 * lat.gsub(",", ".").to_i
    lon = 1 * lon.gsub(",", ".").to_i

    fdat = File.readlines(Rails.root.join("db", "airports.csv"))
    n = fdat.length

    mindist = 999
    minicao = "0000"

    (0..n - 1).each { |i|
      sar = fdat[i].split(",")

      dist = distance(lat, lon, sar[2].to_f, sar[3].to_f)

      if dist < mindist
        mindist = dist
        minicao = sar[0]
      end
    }

    if mindist > 10
      minicao = sprintf("CVN/%s%d", minicao, mindist)
    end

    minicao
  end

  def distance(lat1, lon1, lat2, lon2)
    lat1 = lat1 / 180 * Math::PI
    lon1 = lon1 / 180 * Math::PI
    lat2 = lat2 / 180 * Math::PI
    lon2 = lon2 / 180 * Math::PI
    dlon = lon2 - lon1
    dlat = lat2 - lat1
    a = Math.sin(dlat/2) * Math.sin(dlat/2) + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dlon/2) * Math.sin(dlon/2)
    b = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
    0.54 * 6366.707 * b
  end
end
