class SongsController < ApplicationController
  def index
    array = Array.new
    songs = Song.all
    songs.each do |song|
      array << { id: song.id, title: song.title, artist: song.artist, album: song.album, year: song.year }
    end
    render json: array.as_json
  end

  def find_song
    song = Song.find_by(id: params["id"])
    render json: array.as_json
  end
  
  def create
    song = Song.new(
      id: params["id"],
      title: params["title"],
      artist: params["artist"]
      album: params["album"],
      year: params["year"],
    )
    song.save
    render json: array.as_json
  end
  
  def update
    song = Song.find_by(id: params["id"])
    song.artist = params["artist"] || song.artist
    song.title = params["title"] || song.title
    song.album = params["album"] || song.album
    song.year = params["year"]  || song.year
    
    song.save
    render json: array.as_json
  end
  
  def delete
    song = Song.find_by(id: params["id"])
    song.destroy
    render json: {message: "Song was deleted!"}
  end
end
