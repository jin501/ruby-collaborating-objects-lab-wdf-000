#responsible for either creating the artist 
#or finding the instance of that artist

class Artist

attr_accessor :name, :songs
@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def add_song(song)
  @songs << song
  song.artist = self 
end

def self.all
  @@all
end

def save
  self.class.all << self
  self
end

def self.find_by_name(name)
  self.all.detect{|song| song.name == name}
end

def self.create_by_name(name)
  artist = self.new(name)
  # artist.name = name
end

def self.find_or_create_by_name(name)
  self.find_by_name(name) || self.create_by_name(name).save
end

def print_songs
  self.songs.each {|song| puts song.name}
end

end