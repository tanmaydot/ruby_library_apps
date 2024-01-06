class SectionController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:search].present?
      @sections = Section.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @sections = Section.all
    end
  end

  def new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      redirect_to section_index_path, notice: "Section is created successfully"
    else
      render :new
    end
  end

  def show
    @section = Section.find(params[:id])
    @books = Book.where(section_id: @section.id)
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @sections = Section.find(params[:id])

    if @sections.update(section_params)
      redirect_to section_index_path, notice: "Section is updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @sections = Section.find(params[:id])

    begin
      @sections.destroy
      redirect_to section_index_path, notice: 'Section was successfully deleted.'
    rescue ActiveRecord::InvalidForeignKey
      redirect_to section_index_path, alert: 'Cannot delete the section because it is still referenced.'
    end
  end


  private

  def section_params
    params.require(:section).permit(:name)
  end

end
