class BuildingsController < ApplicationController
    def index
        @buildings = Building.all
    end

    def show
        @building = Building.find(params[:id])
    end

    def edit
        
        @building = Building.find(params[:id])
    end

    def update
        @building = Building.find(params[:id])
        if @building.update(building_params(:name, :country, :address, :rent_per_floor, :number_of_floors))
            redirect_to building_path(@building)
        else
            render 'edit'
        end
    end

    private

    def building_params(*args)
        params.require(:building).permit(*args)
    end
end