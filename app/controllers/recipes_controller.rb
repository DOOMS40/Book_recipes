class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all
  end

  def show
    recipe_find
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @book = Book.find(params[:book_id])
    @recipe = @book.recipes.new(recipe_params)
    if @recipe.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def edit
    recipe_find
  end

  def update
    recipe_find
    if @recipe.update(recipe_params)
      redirect_to @recipe.book
    else
      render :edit
    end
  end

  def destroy
    recipe_find
    @recipe.destroy
    redirect_to @recipe.book 

  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

  def recipe_find
    @recipe = Recipe.find(params[:id])
  end
end
