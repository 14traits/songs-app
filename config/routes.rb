Rails.application.routes.draw do

  # Gets
  get "/songs" => "songs#index"
  get "/songs/:id" => "songs#find_song"

  # Posts
  post "/songs" => "songs#create"

  # Patch
  patch "songs/:id" => "songs#update"

  # Delete
  delete "songs/:id" => "songs#delete"
end
