class RbDropBoxSyncedFolder

  def initialize(path)
    @path = File.expand_path path
    if not Dir.exists? @path then
      raise ArgumentError, "invalid directory"
    end
    @file = File.new(@path)
    @dir = Dir.new(@path)
    @status = :idle
    @files = []
    @rb_synced_files = []
    @rb_synced_folders = []
    __enumerate()
  end

  def get_path
    return @path
  end

  def get_file
    return @file
  end

  def get_dir
    return @dir
  end

  def get_status
    return @status
  end

  def __set_status(status)
    @status = status
  end

  def __enumerate
    get_dir.map do |tpath|
      __add_file(tpath)
    end
    @files.each do |file|
      if File.directory? file.to_path
        rbdir = RbDropBoxSyncedFolder.new file.to_path
        if not @rb_synced_folders.include? rbdir
          @rb_synced_folders << rbdir
        end
      end
    end
  end

  def __add_file(path)
    if path == "." or path == ".." then
      return
    end
    full_path = File.join(get_path, path)
    if not File.exists? full_path then
      raise ArgumentError, "invalid file"
    end
    file = File.new(full_path)
    file.close
    if not @files.include?(file) then
      @files << file
    end
  end

  def sync

  end
end

f = RbDropBoxSyncedFolder.new '~/opt'