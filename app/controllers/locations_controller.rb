class LocationsController < ApplicationController

    def index
        @locations = Location.all
    end

    def show
        @location = Location.find_by(id: params[:id])
    end

    def edit
        @location = Location.find_by(id: params[:id])
    end

    def update
        location = Location.find_by(id: params[:id])
        if location.update(location_params)
            redirect_to location_path(location)
        else
            redirect_to edit_location_path(location), alert: location.errors.full_messages
        end
    end

    def wrecked
        @locations = Location.wrecked.sort_by { |l| l.health }
    end

    private
    def location_params
        params.require(:location).permit(:name)
    end


end
