class Admin::LandmarksController < Admin::BaseController
    before_action :set_landmark, only: %i[edit update show destroy]

    def new
      @landmark = Landmark.new
    end

    def index
        @q = Landmark.ransack(params[:q])
        @landmarks = @q.result(distinct: true)
    end

    def edit; end

    def create
      @landmark = Landmark.new(landmark_params)
        if @landmark.save
          redirect_to admin_landmarks_path, success: '施設を登録しました'
        else
          flash.now[:danger] = "施設の登録に失敗しました"
          render :new
        end
    end

    def update
        if @landmark.update(landmark_params)
          redirect_to admin_landmarks_path, success: '編集しました'
        else
          flash.now[:danger] = "編集に失敗しました"
          render :edit
        end
    end

    def show; end

    def destroy
        @landmark.destroy!
        redirect_to admin_landmarks_path, success: '削除しました'
    end

    private

    def set_landmark
        @landmark = Landmark.find(params[:id])
    end

    def landmark_params
        params.require(:landmark).permit(:person_id, :name, :description_with_person, :longitude, :latitude, :address)
    end
end
