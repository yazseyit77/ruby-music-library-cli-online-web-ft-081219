class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self)
      genre.songs
    else
      genre.songs << self #unless genre.songs.inlcude?(self)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all.uniq
  end

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.name = name
    @@all << song
    song
    new_song = Song.new(song, artist, genre)
    new_song.save
    new_song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    song_name = parts[1]
    artist = Artist.find_or_create_by_name(parts[0])
    genre = Genre.find_or_create_by_name(parts[2].split('.')[0])
    self.create(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
