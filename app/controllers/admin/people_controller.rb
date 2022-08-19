class Admin::PeopleController < Admin::BaseController
before_action :set_person, only: %i[edit update show destroy]

  def new
    @person = Person.new
  end

  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true)
  end

  def edit; end

  def create
      @person = Person.new(person_params)
      if @person.save
        redirect_to admin_people_path, success: '人物データの登録に成功しました'
      else
        flash.now[:danger] = '人物データの登録に失敗しました'
        render :new
      end
  end

  def update
    if @person.update(person_params)
      redirect_to admin_person_path, success: '編集に成功しました'
    else
      flash.now[:danger] = '編集に失敗しました'
      render :edit
    end
  end

  def show; end

  def destroy
    @person.destroy!
    redirect_to admin_people_path, success: '削除しました'
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :description)
  end
end
