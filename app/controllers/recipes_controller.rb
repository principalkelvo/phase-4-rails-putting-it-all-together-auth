class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        render json: Recipe.all, status: :created
    end

    def create
        recipe= Recipe.create(recipe_params.merge(user_id: session[:user_id]))
        if recipe.valid?
            render json: recipe, status: :created
        else
            render json: {errors: recipe.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private

    # def render_unprocessable_entity(invalid)
    #     render json: {error: invalid.record.errors}, status: :unprocessable_entity
    # end

    # def record_not_found
    #   render json: { error: "Recipe not found" }, status: :not_found
    # end
  
    def recipe_params
      params.permit(:instructions, :title, :minutes_to_complete, user_id: session[:user_id])
    end
end
