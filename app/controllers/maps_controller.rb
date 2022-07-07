class MapsController < ApplicationController
  def show
    @person = Person.find(params[:id])
    gon.landmarks = @person.landmarks
  end
end
