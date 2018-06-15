require 'forwardable'

class EnumeratorQueue
  extend Forwardable
  def_delegators :@q, :close, :push

  def initialize()
    @q = Queue.new
  end

  def each_item
    return enum_for(:each_item) unless block_given?
    while r = @q.pop
      fail r if r.is_a? Exception
      yield r
    end
  end
end
