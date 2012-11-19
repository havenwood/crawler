class Future
  def initialize(callable)
    @callable = callable
  end

  def run
    @thread ||= Thread.new { @callable.call }

    self
  end

  def value
    run
    
    @thread.value
  end
end

module Kernel
  def future(&block)
    Future.new(block).run
  end
end
