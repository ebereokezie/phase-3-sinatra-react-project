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
        title: params[:title],
        platform: params[:platform],
        price: params[:price])

     reviews=  Review.create(
        score: params[:score],
        game_id: params[:game_id])

    games.reviews << reviews

    
   games.to_json(only: [:id, :title, :platform, :price], include: {
        reviews: {only: [:score]}
    })

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
