class CountriesController < ApplicationController
  def index
    @countries = Country.all
    render json: {
      items: @countries
    }
  end
end
