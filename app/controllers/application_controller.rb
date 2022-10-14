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

post '/review' do
   reviews=  Review.create(
        score: params[:score],
        game_id: params[:game_id])

    reviews.to_json
end

patch '/games/:id' do
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

delete '/games/:id' do
    games = Game.find(params[:id])
    games.destroy
    games.to_json
end

end
