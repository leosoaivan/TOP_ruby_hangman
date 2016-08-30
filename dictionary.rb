class Dictionary
  attr_accessor :handle

  def initialize(filename)
    @handle = File.readlines(filename)
  end

  def self.clean(handle)
    new(handle).clean
  end

  def finished
    @handle.close
  end

  def clean
    @handle.each { |word| word.gsub!(/\r\n/, "") }
    @handle.delete_if { |word| !word.length.between?(5, 12) }
  end
end
