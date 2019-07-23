


class MultiThreading
  
  def initialize(thread_size: 1, repeat_times: 1, type:nil)
    @thread_size  = thread_size
    @repeat_times = repeat_times
    @type = type if type
  end

  def do_main
    @repeat_times.times do |repeat_time|
      threads = @thread_size.times.map do |i|
        Thread.new do
          build_worker("#{repeat_time}-#{i}").do_task
        end
      end
      threads.each do |thread| thread.join end
    end
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
  MultiThreading.new(thread_size: 5, repeat_times: 2).do_main
end

