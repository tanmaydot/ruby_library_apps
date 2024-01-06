class RakController < ApplicationController
  load_and_authorize_resource
  def index
    if params[:search].present?
      @raks = Rak.where("name ILIKE ?", "%#{params[:search]}%")
    else
      @raks = Rak.all
    end
  end

  def new
    @rak = Rak.new
  end

  def create
    @rak = Rak.create(rak_params)

    if @rak.save
      redirect_to rak_index_path, notice: "Rak is created successfully"
    else
      redirect_to new_rak_path
    end
  end

  def show
    @rak = Rak.find(params[:id])
    @section = Section.where(section_id: @rak.id)
    @books = Book.where(rak_id: @rak.id)
  end

  def edit
    @rak = Rak.find(params[:id])
  end

  def update
    @rak = Rak.find(params[:id])

    if @rak.update(rak_params)
      redirect_to rak_index_path, notice: "Rak is updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @rak = Rak.find(params[:id])
    @rak.destroy
    redirect_to rak_index_path, notice: 'Rak was successfully deleted.'
  end

  private

  def rak_params
    params.require(:rak).permit(:name, :section_id)
  end
end
