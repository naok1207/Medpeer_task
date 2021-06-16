require 'rails_helper'

RSpec.describe "Api::Idea", type: :request do
  describe 'GET request' do
    describe 'success' do
      it 'can get all idea' do
        create(:category, :with_ideas)

        get '/api/ideas'
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['data'].length).to eq(5)
      end

      it 'can get idea in assosiation with category' do
        create(:category, :with_ideas, name: 'test-category')

        get '/api/ideas', params: { category_name: 'test-category' }
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['data'].length).to eq(5)
      end
    end

    describe 'failed' do
      it 'when category not exsits' do
        create(:category, :with_ideas, name: 'test-category')
        get '/api/ideas', params: { category_name: 'not-exist-category' }
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['status']).to eq(404)
      end
    end
  end

  describe "POST request" do
    describe 'success' do
      it 'can create idea with new category' do
        expect {
          post '/api/ideas', params: { category_name: 'test-category', body: "test-idea" }
        }.to change(Idea, :count).by(+1).and change(Category, :count).by(+1)
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['status']).to eq(201)
      end

      it 'can create idea with created category' do
        create(:category, name: 'test-category')

        expect {
          post '/api/ideas', params: { category_name: 'test-category', body: "test-idea" }
        }.to change(Idea, :count).by(+1).and change(Category, :count).by(+0)
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['status']).to eq(201)
      end
    end

    describe 'failed' do
      it 'when category_name is null' do
        post '/api/ideas', params: { category_name: '', body: 'test-idea' }
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['status']).to eq(422)
      end

      it 'when body is null' do
        post '/api/ideas', params: { category_name: 'test-category', body: '' }
        json = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json['status']).to eq(422)
      end
    end
  end
end
