class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/todos' do
    todos = ToDo.all
    todos.to_json
end

post '/todos' do
    todos = ToDo.create(
        body: params[:body],
        day: params[:day]
    )

   todos.to_json
end

patch '/todos/:id' do
   todos_body = ToDo.find(params[:id])
    todos_body.update(
        body: params[:body]
    )

    todos_body.to_json
end

delete '/todos/:id' do
    message = ToDo.find(params[:id])
    todos.destroy
    todos.to_json
end

end
