class RbDropBoxSyncedFolder

  def initialize(local_path, remote_path)
    @local_path = File.expand_path local_path
    @remote_path = remote_path
    if not Dir.exists? @local_path then
      raise ArgumentError, "invalid directory"
    end
    @file = File.new(@local_path)
    @dir = Dir.new(@local_path)
    @state = :unknown #valid states are :unknown :synchronized :synchronizing :local_only :remote_only
    @files = []
    @rb_synced_files = []
    @rb_synced_folders = []
    __enumerate()
  end

  def get_path
    return @local_path
  end

  def get_file
    return @file
  end

  def get_dir
    return @dir
  end

  def get_state
    return @state
  end

  def sync

  end

  def eql?(other)
    return self.class == other.class && self.hash == other.hash
  end

  alias == eql?

  def hash
    return get_path.hash
  end

  private

  def __set_state(state)
    @state = state
  end

  def __enumerate
    __set_state :synchronizing
    get_dir.map do |tpath|
      __add_file tpath
    end
    @files.each do |file|
      if File.directory? file.to_path
        rbdir = RbDropBoxSyncedFolder.new file.to_path
        if not @rb_synced_folders.include? rbdir
          __set_state :unsynchronized
          @rb_synced_folders << rbdir
        end
      end
      if File.file? file.to_path
        rbfile = RbDropBoxSyncedFile.new self, file.to_path
        if not @rb_synced_files.include? rbfile
          __set_state :unsynchronized
          @rb_synced_files << rbfile
        end
      end
    end
    __sync
  end

  def __add_file(path)
    if path == "." or path == ".." then
      return
    end
    full_path = File.join(get_path, path)
    if not File.exists? full_path then
      raise ArgumentError, "invalid file"
    end
    file = File.new full_path
    file.close
    if not @files.include? file then
      @files << file
    end
  end

  def __sync
    __set_state :synchronizing

    __set_state :synchronized
  end


end
