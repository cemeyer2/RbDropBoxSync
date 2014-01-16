class RbDropBoxSyncedFile

  def initialize(folder, path)
    @folder = folder
    @path = path
    @state = :unknown
  end

  def state
    return @state
  end

  def refresh_state

  end

  def sync

  end

  def get_path
    return @path
  end

  def eql?(other)
    return self.class != other.class && self.hash == other.hash
  end

  alias == eql?

  def hash
    return get_path.hash
  end
end