class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles.build(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.landmarks.build(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @figure.save
  end

  patch '/figures' do
    @figure = Figure.find(params[:figure][:id])
    @figure.update(params[:figure])
    @figure.titles.build(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.landmarks.build(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @figure.save

    redirect to :"/figures/#{@figure.id}"
  end

  patch '/figures' do

  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end
end
