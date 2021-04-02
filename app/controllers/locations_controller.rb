class LocationsController < ApplicationController

    before_action :set_location, except: [:index, :wrecked]
    before_action :require_login

    def index
        @locations = Location.all
    end

    def show
    end

    def edit
    end

    def update
       if @location.update(location_params)
            redirect_to location_path(@location)
        else
            @errors = @location.errors.full_messages
            render :edit
        end
    end

    def wrecked
        @locations = Location.wrecked.weak_to_strong
    end

    private
    def location_params
        params.require(:location).permit(:name)
    end

    def set_location
        @location = Location.find_by(id: params[:id])
     end

end
