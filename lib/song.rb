class Song 
    @@all = []
    attr_accessor :name, :artist
    # attr_reader :artist_name
    def initialize(name)
        @name = name
        save
    end
    def save 
        @@all << self
    end
    def self.all
        @@all
    end
    def artist_name= (name)
        # find_or_create_by_name Artists class method can be used here
        self.artist = Artist.find_or_create_by_name(name)
    end
    def self.new_by_filename(file)
        # parse file into components where the first is for artist name
        #second element is the name of the song
        #create an instance of the song
        #song's artist should be assigned to an artist
        # return the song
        parse_file = file.split(' - ')
        artist_name = parse_file[0]
        song_name = parse_file[1]

        song = self.new(song_name)
        song.artist = Artist.find_or_create_by_name(artist_name)
        song
    end
end