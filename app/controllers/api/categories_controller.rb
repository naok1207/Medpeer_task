# frozen_string_literal: true

module Api
  class CategoriesController < ApplicationController
    def show
      ideas = Idea.response_ideas(params[:category_name])
      render json: { data: ideas }
    rescue StandardError
      render json: { status: 404 }
    end
  end
end
