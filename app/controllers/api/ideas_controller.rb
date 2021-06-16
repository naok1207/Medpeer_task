module Api
    class IdeasController < ApplicationController
        def create
            category = Category.find_or_create_by!(name: params[:category_name])
            idea = category.ideas.create!(body: params[:body])
            render json: { status: 201 }
        rescue
            render json: { status: 422 }
        end
    end
end
