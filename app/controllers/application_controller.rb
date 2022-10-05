class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/games' do
    games = Games.all
    games.to_json
end

get '/games/:platform' do
    games = Games.find(params[:platform])
    games.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score, :comment]}
    })
end

post '/games' do
    games = Game.create(
        body: params[:body],
        day: params[:day]
    )

   games.to_json
end

patch '/games/:id' do
   games_body = Game.find(params[:id])
    games_body.update(
        body: params[:body]
    )

    games_body.to_json
end

delete '/games/:id' do
    message = Game.find(params[:id])
    games.destroy
    games.to_json
end

end
