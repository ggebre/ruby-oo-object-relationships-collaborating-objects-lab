require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize (path)
        @path = path
    end
    def files 
        # load files in a directory at the given file path
        Dir.entries(@path).select {|file| file.end_with?("mp3")}
    end

    def import 
        # create song instances using the filenames from file
        files.each {|file| Song.new_by_filename(file) }
    end
end