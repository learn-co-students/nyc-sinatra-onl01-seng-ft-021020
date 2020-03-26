class FiguresController < ApplicationController
    get '/figures' do
        @figures = Figure.all
        erb :"/figures/index"
    end
  
    get '/figures/new' do
        @titles = Title.all
        @landmarks = Landmark.all
        erb :"/figures/new"
    end

    get '/figures/:id' do
        @figure = Figure.find_by_id(params[:id])
        erb :"/figures/show"
    end

    post '/figures' do
        @title = params[:title]
        @title_ids = params[:figure][:title_ids]
        @landmark = params[:landmark]
        @landmark_ids = params[:figure][:landmark_ids]

        @figure = Figure.create(name: params[:figure][:name])
        if !@title[:name].empty?
            #new title
            t = Title.create(name: @title[:name])
            @figure.titles << t
        end
        if @title_ids
            #existing ids
            @title_ids.each do |id|
                t = Title.find(id)
                @figure.titles << t
            end
        end
        if !@landmark[:name].empty?
            #new landmark
            l = Landmark.create(name: @landmark[:name], year_completed: @landmark[:year])
            @figure.landmarks << l
        end
        if @landmark_ids
            #existing ids
            @landmark_ids.each do |id|
                l = Landmark.find(id)
                @figure.landmarks << l
            end
        end
        @figure.save
        redirect "/figures/#{@figure.id}"
    end

    get '/figures/:id/edit' do
        @figure = Figure.find_by_id(params[:id])
        @titles = Title.all
        @landmarks = Landmark.all
        erb :"/figures/edit"
    end

    patch '/figures/:id' do
        @title = params[:title]
        @title_ids = params[:figure][:title_ids]
        @landmark = params[:landmark]
        @landmark_ids = params[:figure][:landmark_ids]
        @figure = Figure.find_by_id(params[:id])
        @figure.name = params[:figure][:name]
        @figure.titles.clear
        @figure.landmarks.clear
        
        if !@title[:name].empty?
            #new title
            t = Title.create(name: @title[:name])
            @figure.titles << t
        end
        if @title_ids
            #existing ids
            @title_ids.each do |id|
                t = Title.find(id)
                @figure.titles << t
            end
        end
        if !@landmark[:name].empty?
            #new landmark
            l = Landmark.create(name: @landmark[:name], year_completed: @landmark[:year])
            @figure.landmarks << l
        end
        if @landmark_ids
            #existing ids
            @landmark_ids.each do |id|
                l = Landmark.find(id)
                @figure.landmarks << l
            end
        end
        @figure.save
        redirect "/figures/#{@figure.id}"
    end
end

