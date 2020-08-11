class RecipesController < ApplicationController
before_action :find_recipe, only: [:show, :edit, :update, :destroy]

def index
    @recipes = Recipe.all
end

def show
end

def new
    @recipe = Recipe.new
end

def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.valid?
        @recipe.save
        redirect_to recipe_path(@recipe)
    else
        render :new
    end
end

def edit
end

def update
    @recipe.assign_attributes(recipe_params)
    if @recipe.valid?
        @recipe.save
        redirect_to recipe_path(@recipe)
    else
        render :edit
    end
end

def destroy
    @recipe.destroy
    redirect_to recipes_path
end


private
def find_recipe
    @recipe = Recipe.find(params[:id])
end

def recipe_params
    params.require(:recipe).permit(:name, :vegetarian, :difficulty, :duration_in_min, :ingredient_ids => [])
end

end
