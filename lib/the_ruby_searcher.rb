require 'open3'

class Rbsearcher
  def initialize(engine='ag')
  	@engine = engine
  end

  def check
  	cmd = ["which", @engine].join(" ")
    stdout, stdeerr, status = Open3.capture3(cmd)
    if stdout.include? 'not found'
      return false
    else
      return true
    end
  end

  def switch(engine)
    @engine = engine
  end

  def search(pattern, path)
    if not check()
      puts "Select Engine not exist, automatically switch to grep"
      @engine = 'grep'
    end
    cmd = [@engine, pattern, path].join(" ")
    puts cmd
    stdout, stdeerr, status = Open3.capture3(cmd)
    return stdout, stdeerr, status
  end
end