class LandmarksController < ApplicationController
# renders form to create a new landmark
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

# receives form input and creates a new landmark
  post '/landmarks' do
    Landmark.create(params[:landmark]) if !params[:landmark].empty?
  end

# renders form to display all landmarks
  get '/landmarks' do
    erb :'/landmarks/index'
  end

# allows you to see a single landmark
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end

# allows you to view the form to edit a landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

# allows you to edit a landmark
  patch '/landmarks/:id' do
    landmark = Landmark.find_by_id(params[:id])
    landmark.update(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{landmark.id}"
  end

end
