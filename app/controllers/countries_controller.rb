class CountriesController < ApplicationController
  before_action :require_login

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find_by(id: params[:id])
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @country}
    end
  end

end
