class ImagesController < ApplicationController
  def index
    @profile = User.find(params[:profile_id])
    @images = @profile.images
    @new_image = Image.new
    
  end
  
  def create
    @new_image = Image.new(image_params)
    @new_image.user = current_user

    if @new_image.save
      flash[:notice] = "Foto salva em sua galeria!"
    else
      flash[:alert] = "A foto não pôde ser salva..."
    end

    redirect_to my_profile_path
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    @profile = current_user
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to profile_images_path(@profile.id)
  end

  private

  def image_params
    params.require(:image).permit(:title, :description, :photo)
  end
end
