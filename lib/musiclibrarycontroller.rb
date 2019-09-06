class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    answer = ""

    while answer != 'exit'

      puts "What would you like to do?"

    answer = gets.strip
    case answer
    when 'list songs'
      songs
    when 'list artists'
      artists
    when 'list genres'
      genres
    when 'list artist'
      list_artist
    when 'list genre'
      list_genre
    when 'play song'
      play_song
    end
    end
  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all.sort {|a,b| a.name <=> b.name}
    artists.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name}"}
  end

  def list_genres
    genres = Genre.all.sort{|a,b| a.name <=> b.name}
    genres.each.with_index(1){|genre, i| puts "#{i}. #{genre.name}"}
  end

  def list_songs_by_artist

  end

end
