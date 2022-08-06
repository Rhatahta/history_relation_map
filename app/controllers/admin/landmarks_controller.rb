class Admin::LandmarksController < Admin::BaseController
    before_action :set_landmark, only: %i[edit update show destroy]
    def index
        @q = Landmark.ransack(params[:q])
        @landmarks = @q.result(distinct: true)
    end

    def edit; end

    def update
        if @landmark.update(landmark_params)
          redirect_to admin_landmarks_path
        else
          render :edit
        end
    end

    def show; end

    def destroy
        @landmark.destroy!
        redirect_to admin_landmarks_path
      end

    private

    def set_landmark
        @landmark = Landmark.find(params[:id])
    end

    def landmark_params
        params.require(:landmark).permit(:name, :description_with_person)
    end
end
