module Api
  class CategoriesController < ApplicationController
    def show
      ideas = Category.response_ideas(params[:category_name])
      render json: { data: ideas }
    rescue
      render json: { status: 404 }
    end
  end
end
