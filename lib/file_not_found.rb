class FileNotFound < StandardError
  def initialize(msg = 'file not found')
    super
  end
end