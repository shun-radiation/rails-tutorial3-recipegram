class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "投稿に成功しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    if @recipe.user != current_user
      redirect_to recipes_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "更新に成功しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :body, :image)
  end
end
