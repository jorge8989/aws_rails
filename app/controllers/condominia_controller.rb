class CondominiaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_condo, only: [:edit, :update, :destroy]

  def index
    @condominia = Condominium.all
  end

  def destroy
    @condominium.destroy
    redirect_to condominia_path
  end

  def edit
  end

  def update
    if @condominium.update(condo_params)
      redirect_to condominia_path
    else
      render :new
    end
  end

  def new
    @condominium = Condominium.new
  end

  def create
    @condominium = Condominium.new(condo_params)
    if @condominium.save
      redirect_to condominia_path
    else
      render :new
    end
  end

  private

  def condo_params
    params.require(:condominium).permit(:name)
  end

  def set_condo
    @condominium = Condominium.find(params[:id])
  end
end