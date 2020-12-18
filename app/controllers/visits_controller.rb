class VisitsController < ApplicationController
    before_action :set_visit, only: [:show, :update, :destroy]
    before_action :require_authorization!, only: [:show, :update, :destroy]
   
    # GET /api/v1/visits
   
    def index
      @visits = current_user.visits
      render json: @visits
    end
   
    # GET /api/v1/visits/1
   
    def show
      render json: @visit
    end
   
    # POST /api/v1/visits
    def create
      @visit = Visit.new(visit_params.merge(user: current_user))
      if @visit.save
        render json: @visit, status: :created
      else
        render json: @visit.errors, status: :unprocessable_entity
      end
    end
   
    # PATCH/PUT /api/v1/visits/1
    def update
      if @visit.update(visit_params)
        render json: @visit
      else
        render json: @visit.errors, status: :unprocessable_entity
      end
    end
   
    # DELETE /api/v1/visits/1
    def destroy
      @visit.destroy
    end
   
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_visit
        @visit = Visit.find(params[:id])
    end
   
    # Only allow a trusted parameter "white list" through.
    def visit_params
        params.require(:visit).permit(:name, :data_visita, :checkin, :checkout, :formulario)
    end
   
    def require_authorization!
        unless current_user == @visit.user
        render json: {}, status: :forbidden
        end
    end
end
