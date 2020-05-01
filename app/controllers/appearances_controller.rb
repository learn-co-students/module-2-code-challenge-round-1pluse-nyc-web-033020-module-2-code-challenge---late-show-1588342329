class AppearancesController < ApplicationController
    def index
        @appearances = Appearance.all
    end

    def show
        @appearance = Appearance.find(params[:d])
    end

    def new
        @appearance = Appearance.new
    end

    def create
        @appearance = Appearance.create(appearance_params)
        if @appearance.valid?
            redirect_to appearance_path(@appearance)
        else
            flash[:errors] = @appearance.errors.full_messages
            redirect_to new_appearance_path
        end
    end

    private

    def appearance_params
        params.require(:appearance).permit(:guest_id, :episode_id)
    end
end
