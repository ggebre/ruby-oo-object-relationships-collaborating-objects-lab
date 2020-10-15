require 'pry'
class Artist
    @@all = []
    attr_accessor :name
    def initialize (name)
        @name = name
        save
    end

    def songs 
        # select the songs that belong to self artist
        Song.all.select {|song|  song.artist == self } 
    end

    def add_song(song)
        song.artist = self
    end
    def save 
        @@all << self
    end
    def print_songs 
        songs.each {|song| puts song.name}
    end
    def self.find_or_create_by_name (name)
        # detect if there is an artist with the given name
        #if it does not exist, create an instance of Artist with the given name
        find_artist = all.detect {|artist| artist.name == name }
        find_artist ? find_artist : self.new(name)
    end
    

    def self.all 
        @@all
    end
end