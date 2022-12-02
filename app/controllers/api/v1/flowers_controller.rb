class Api::V1::FlowersController < ApplicationController
  before_action :set_flower, only: %i[update destroy]

  def index
    @flowers = Flower.all.includes(:flower).order(created_at: :desc)
    render json: @flowers
  end

  def create
    @flower = current_user.flower.build(flower_params)
    if @flower.save
      render json: @flower, status: :created
    else
      render json: @flower.errors, status: :unprocessable_entiey
    end
  end

  def edit
    @flowers = Flower.find(params[:id])
    render json: @flower
  end

  def update
    if @flower.update(flower_params)
      render json: @flower, status: :ok
    else
      render json: @flower.errors, status: :unprocessable_entiey
    end
  end

  def destroy
    @flower.destroy!
  end

  private
  def flower_params
    params.require(:flower).permit(:address, :image, :name, :datetime, :status)
  end

  def set_flower
    @flowers = current_user.flower.find(params[:id])
  end
end
