class RbDropBoxSync

  def self.get_config(key)
    config = YAML.load_file("/home/cemeyer/rbdbsconfig.yaml")
    return config[key].strip() if config.include? key
    return nil
  end

  def initialize
    @connection = Object.new
  end
end