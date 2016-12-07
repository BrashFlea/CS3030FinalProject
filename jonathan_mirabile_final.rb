#!/usr/bin/env ruby
#
# jonathan_mirabile_final.rb
# Copyright (C) 2016 Jonathan Mirabile <jonathanmirabile@mail.weber.edu>
#
# Distributed under terms of the MIT license.
#
# Final project for CS3030
# Recreation of Python Homework 6 - Apache error log report tool using Ruby
# Note: report best viewed in full screen as errors are verbose
require 'open-uri'
arg = ARGV[0]


def help()
	puts "Usage is ./jonathan_mirabile_final.rb <file input>"
end


def fetch_url(arg)
	contents = open(arg).read
	data = Array[]
	i = 0
	#Regex checks for 4 groups:
	#1: []
	#2: [error]
	#3: []
	#4: Rest of string
	#Then ignores groups 1-3 and leaves group 4 (the verbose error) 
	contents.scan(/(?:\[.*?\]) (?:\[error\]) (?:\[.*?\]) (.*)/) do |match|
		data[i] = match
		i += 1
	end
	#Create a hash to count errors
	counts = Hash.new 0
	data.each do |match|
		counts[match] += 1
	end
	puts "*** Top 25 Errors***"
	counts.keys.sort_by{|key| counts[key]}.reverse.each_with_index { |key, index| puts "Count: #{counts[key]} Error: #{key}" if index < 25 }
end


unless ARGV.length == 1
	help()
	exit(1)
end


puts "Fetching file from #{ARGV[0]}"
fetch_url(arg)
exit(0)



