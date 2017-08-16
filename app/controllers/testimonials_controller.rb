class TestimonialsController < ApplicationController
  before_action :find_testimonial,  only: [:show, :edit, :update, :destroy]
  def index
    @testimonials = Testimonial.all
  end

  def new
    @testimonial = Testimonial.new
  end

  def create
    @testimonial = Testimonial.new testimonial_params

    if @testimonial.save
      redirect_to root_path, notice: "Your Testimonial has been saved."
    else
      render 'new', notice: "E R R O R !!!  Please try again. If not contact Brandon at 615-337-6981"
    end
  end

  def show
  end

  def update
    if @testimonial.update testimonial_params
      redirect_to root_path, notice: "You have updated your testimonial from #{@testimonial.name}"
    else
      render 'edit'
    end
  end
  
  def destroy
    @testimonial.destroy
    redirect_to root_path
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:name, :description)
  end

  def find_testimonial
    @testimonial = Testimonial.find(params[:id])
  end

end
