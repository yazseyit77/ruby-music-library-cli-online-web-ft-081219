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

  def self.create(name)
    song = self.new(name)
    song.name = name
    @@all << song
    song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
