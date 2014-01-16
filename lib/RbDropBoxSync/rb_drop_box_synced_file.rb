class RbDropBoxSyncedFile

  def initialize(folder, path)
    @folder = folder
    @local_path = path
    @state = :unknown #valid states are :unknown :synchronized :synchronizing :local_only :remote_only
  end

  def state
    return @state
  end

  def refresh_state

  end

  def sync

  end

  def get_path
    return @local_path
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

end