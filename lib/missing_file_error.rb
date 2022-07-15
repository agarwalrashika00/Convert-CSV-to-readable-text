class MissingFileError < StandardError
  def initialize(msg = 'file not found')
    super
  end
end