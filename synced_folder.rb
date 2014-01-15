require 'yaml'

class SyncedFolder

  def initialize(path)
    @path = File.expand_path path
    if not Dir.exists? @path then
      raise ArgumentError, "invalid directory"
    end
  end

  def get_path
    return @path
  end

end

f = SyncedFolder.new '~/opt'
puts f.get_path