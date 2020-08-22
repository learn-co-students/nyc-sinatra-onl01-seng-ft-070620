class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    if !params[:figure].empty?
      @figure = Figure.create(params[:figure])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark][:name].empty?
      if !params[:landmark][:year_completed].empty?
        @figure.landmarks << Landmark.create(params[:landmark])
      else
        @figure.landmarks << Landmark.create(name: params[:landmark][:name])
      end
    end

    @figure.save
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])

    # updating, not creating
    if !params[:figure].empty?
      @figure.update(params[:figure])
    end

    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end

    if !params[:landmark].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end

    @figure.save
    redirect "/figures/#{@figure.id}"
   end

end
