class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  require 'pry'
  
  # Add your routes here
  get '/games' do
    
    games = Game.all
    games.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score, :game_id]}
    })

end


post '/games' do
    games = Game.create(
        title: params[:title],
        platform: params[:platform],
        price: params[:price])

  

  

    
   games.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score, :game_id]}
    })

 
end

post '/reviews/:id' do
    game = Game.find(params[:id])

   game.reviews.create(
        score: params[:score])

    game.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score, :game_id]}
    })

end

patch '/game/:id' do
   games_body = Game.find(params[:id])
    games_body.update(
        title: params[:title],
        platform: params[:platform],
        price: params[:price]
    )

       
 games_body.to_json(only: [:id, :title, :platform, :price], include: {
    reviews: {only: [:score]}
})
end

delete '/game/:id' do
    games = Game.find(params[:id])
    games.destroy
    games.to_json
end

end
