class Api::V1::FlowersController < ApplicationController
  before_action :set_flower, only: %i[edit show]

  def index
    @flowers = Flower.all.includes(:flower).order(created_at: :desc)
    render json: @flowers
  end

  def show
    render json: @flower
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
    render json: @flower
  end

  def update
    @flowers = current_user.flower.find(params[:id])
    if @flower.update(flower_params)
      render json: @flower, status: :ok
    else
      render json: @flower.errors, status: :unprocessable_entiey
    end
  end

  def destroy
    @flowers = current_user.flower.find(params[:id])
    @flower.destroy!
  end

  private
  def flower_params
    params.require(:flower).permit(:address, :image, :name, :datetime, :status)
  end

  def set_flower
    @flowers = Flower.find(params[:id])
  end
end
