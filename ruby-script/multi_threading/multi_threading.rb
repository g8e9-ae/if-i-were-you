


class MultiThreading
  
  def initialize(thread_size: 1, type:nil)
    @thread_size = thread_size
    @type = type if type
  end

  def do_main
    threads = @thread_size.times.map do |i|
      Thread.new do
        build_worker(i).do_task
      end
    end

    threads.each do |thread| thread.join end
  end

  private
  
  #
  # creating the instances by string may be better
  #
  def build_worker(i)
    case @type
    when :worker_a
      Worker_A.new(index: i)
    when :worker_b
      Worker_B.new(index: i)
    else
      Worker_Default.new(index: i)
    end
  end

end

class Worker
  
  def initialize(index: nil)
    @index = index
  end

  def do_task
    puts "i am #{self} initialized by #{@index}. i am working"
  end

end

class Worker_Default < Worker; end
class Worker_A < Worker; end
class Worker_B < Worker; end

if __FILE__ == $0
  MultiThreading.new(thread_size: 10).do_main
end

