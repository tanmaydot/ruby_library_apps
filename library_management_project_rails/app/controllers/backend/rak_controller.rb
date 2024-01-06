class Backend::RakController < ApplicationController

  def index
    render json: Rak.where(section_id: params[:sectionId])
  end

end
