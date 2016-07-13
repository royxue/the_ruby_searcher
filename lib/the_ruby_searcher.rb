module Ag
  extend self

  def search(pattern, path, e = "ag")
    engine = find_engine(e)
    warn(e,engine) if e != engine
    cmd = [engine, pattern, path, "-n"]
    out = IO.popen(cmd).read
    if out != ""
      out.split("\n").map{ |l| l.split(":") }.to_h
    else
      raise SystemCallError, "Something went wrong, check the logs."
    end
  end

  private

  def warn(e,engine)
    puts "WARN: Could not find search engine: #{e}. Using #{engine}."
  end

  def check(engine)
    cmd = ["which", engine].join(" ")
    stdout = IO.popen(cmd).read
    if stdout != "" and engines.include? engine
      return false
    else
      return true
    end
  end

  def engines
    ["ag", "ack", "grep"]
  end

  def find_engine(e)
    while check(e)
      index = engines.index(e)
      index = index + 1 rescue 0
      if index < engines.size
        e = engines[index]
      else
        raise ArgumentError, "Could not find any compatible search engines installed on system. Try installing Ag: https://github.com/ggreer/the_silver_searcher"
      end
    end
    e
  end
end