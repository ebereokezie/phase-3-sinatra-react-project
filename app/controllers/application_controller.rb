class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/games' do
    games = Game.all
    games.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score]}
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
