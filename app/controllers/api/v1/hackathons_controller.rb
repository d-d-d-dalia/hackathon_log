class Api::V1::HackathonsController < ApplicationController

    before_action :find_hackathon, only: [:update]

  def index
    @hackathons = Hackathon.all
    render json: @hackathons
  end

  def update
    @hackathon.update(hackathon_params)
    if @hackathon.save
      render json: @hackathon, status: :accepted
    else
      render json: { errors: @hackathon.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def hackathon_params
    params.permit(:title, :date)
  end

  def find_hackathon
    @hackathon = Hackathon.find(params[:id])
  end


end
