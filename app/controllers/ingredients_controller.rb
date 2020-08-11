class IngredientsController < ApplicationController

    before_action :find_ingred, only: [:show, :edit, :update, :destroy]
    def index
        @ingredients = Ingredient.all 
    end

    def show
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        @ingredient = Ingredient.new(ingred_params)
        if @ingredient.valid?
            @ingredient.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end
    




    private
    
    def find_ingred
        @ingredient = Ingredient.find(params[:id])
    end

    def ingred_params
        params.require(:ingredient).permit(:name, :recipe_ids => [])
    end
end
