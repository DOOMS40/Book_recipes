class RecipeImagesController < ApplicationController
  def index
    
    @recipe_images = Recipe_Image.all
  end

  def show 
    recipe_image_find
  end

  def new
    @recipe_image = Recipe_Image.new
  end
  
  def create
    @recipe = Recipe.find(params[:id])
    @recipe_image = @recipe.recipe_images.new(recipe_images_params)
    if @recipe_image.save
      redirect_to @recipe_image.recipe
    else
      render :new
    end
  end

  def update
    @recipe_image_find
    if @recipe_image.update!
      redirect_to @recipe_image.recipe
    else
      render :show
    end
  end

    private

      def recipe_images_params
        params.require(:recipe_image).permit(:image, :description)
      end
    

    def recipe_image_find
      @recipe_image = Recipe_Image.find(params[:id])
    end

end


