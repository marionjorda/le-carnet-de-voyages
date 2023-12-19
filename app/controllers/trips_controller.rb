class TripsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    def index
        @trips = Trip.all
    end
    def show
        @trips = Trip.all
        render json: @trips
    end

    def create
        @trip_params = trip_structure(params)
        @trip = Trip.create(@trip_params)
        if @trip
            render json: @trip, status: :ok
        else
            render json: { error: "Erreur dans la création du voyage" }, status: :not_found
    
        end
    end

    def update
        @trip_params = trip_structure(params)
        @trip = Trip.find_by(id: @trip_params["id"])
        if @trip
            @trip = @trip.update(@trip_params)
            return render json: @trip, status: :ok
        end
        render json: { error: "Voyage introuvable !" }, status: :not_found
    end

    def delete
        @trip_params = trip_structure(params)
        @trip = Trip.find_by(id: @trip_params["id"])
        if @trip
            @trip.destroy
            render json: { message: "Suppression réussi !" }, status: :ok
        else
            render json: { error: "Voyage introuvable !" }, status: :not_found
        end
    end
    
    def trip_structure(trip_data)
        trip_data.permit(:id,:destination,:description,:date_debut,:date_fin,:user_id)
    end

    def new
        @users = User.all
        render template: "trips/new"
    end

end
