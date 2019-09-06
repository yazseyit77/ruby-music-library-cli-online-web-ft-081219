
class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end
<<<<<<< HEAD

  def import
    files.each{|f| Song.create_from_filename(f)}
  end
=======
>>>>>>> 5bcabcce6c622e2165e419d5590a348a9faffda4
end
