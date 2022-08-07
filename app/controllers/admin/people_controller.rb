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
        redirect_to admin_people_path
      else
        render :new
      end
  end

  def update
    if @person.update(person_params)
      redirect_to admin_person_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @person.destroy!
    redirect_to admin_people_path
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def person_params
    params.require(:person).permit(:name, :description)
  end
end
