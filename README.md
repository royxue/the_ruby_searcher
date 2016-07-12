# The ruby searcher
Simple ruby bindings for ag, ack, grep, etc.

---
###Installation
	
	gem install the_ruby_searcher

or add 'the_ruby_searcher' to your gem file. use 

	bundle install

###Recomended Engine
[silver searcher](https://github.com/ggreer/the_silver_searcher)
	
###Usage
	
	require 'the_ruby_searcher'
	
	rs = Rbsearcher.new 'ag' (ag is cmd of silver searcher)
	rs.search(patter, file_path)
