# The ruby searcher
Simple ruby bindings for ag, ack, grep, etc.

Requires ruby 1.9+.

---
###Installation
	
	gem install the_ruby_searcher

or add 'the_ruby_searcher' to your gem file. use 

	bundle install

###Recomended Engine
[silver searcher](https://github.com/ggreer/the_silver_searcher)
	
###Usage
	
	require 'the_ruby_searcher'	
	rs = Ag.search(pattern, file_path, [engine], lno)

	with lno: true 
	=> {line_no => line}

	with lno: false (default)
	=> [line]