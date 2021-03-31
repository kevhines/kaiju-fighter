class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find_by(id: params[:id])
    end

    def edit
    end

end
