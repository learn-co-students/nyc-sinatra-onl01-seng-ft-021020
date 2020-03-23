class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
  end

  patch '/landmarks' do
    Landmark.update(params[:lid], params[:landmark])
    redirect to :"/landmarks/#{params[:lid]}"
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

end
