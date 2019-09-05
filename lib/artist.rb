class Artist
  attr_accessor :name, :genres, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist == self
      song.artist
    else
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.name = name
    @@all << artist
    artist
  end
end
