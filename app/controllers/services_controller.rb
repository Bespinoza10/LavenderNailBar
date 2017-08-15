class ServicesController < ApplicationController

  def show
    render params[:service]
  end

end
