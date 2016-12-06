#!/usr/bin/env ruby
#
# jonathan_mirabile_final.rb
# Copyright (C) 2016 Jonathan Mirabile <jonathanmirabile@mail.weber.edu>
#
# Distributed under terms of the MIT license.
#
# Final project for CS3030
# Recreation of Python Homework 6 using Ruby
# irb opens the ruby REPL
require 'open-uri'
uri = open('http://icarus.cs.weber.edu/~hvalle/cs3030/data/error.log.test')
contents = uri.read
data = Array[]
i = 0
contents.scan(/(?:\[.*?\]) (?:\[error\]) (?:\[.*?\]) (.*)/) do |match|
	data[i] = match
	i += 1
end
counts = Hash.new 0
data.each do |match|
	counts[match] += 1
end

counts.keys[1..25].each { |key| puts "#{counts[key]} => #{key}" }





