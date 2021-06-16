class Category < ApplicationRecord
  has_many :ideas

  validates :name, presence: true, uniqueness: true

  # アイデア一覧取得
  def self.response_ideas(category_name)
    if category_name.present?
      category = Category.find_by!(name: category_name)
      ideas = category.ideas
    else
      ideas = Idea.all
    end
    return ideas.map do |idea|
      {
        id: idea.id,
        category: idea.category.name,
        body: idea.body
      }
    end
  end
end
