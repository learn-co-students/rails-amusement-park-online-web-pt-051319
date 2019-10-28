class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end