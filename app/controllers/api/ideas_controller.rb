# frozen_string_literal: true

module Api
  class IdeasController < ApplicationController
    def show
        ideas = Idea.response_ideas(params[:category_name])
        render json: { data: ideas }
      rescue StandardError
        render json: { status: 404 }
      end

    def create
      category = Category.find_or_create_by!(name: params[:category_name])
      category.ideas.create!(body: params[:body])
      render json: { status: 201 }
    rescue StandardError
      render json: { status: 422 }
    end
  end
end
