#!/bin/ruby

ratios = []
frogs_case = []
trochia_case = []

File.foreach("sim-time.dat"){|line|
  line.chomp
  data = line.split
  ratios.push data[1].to_f / data[2].to_f
  frogs_case.push data[1].to_f / data[0].to_f
  trochia_case.push data[2].to_f / data[0].to_f
}

puts "ratio: #{ratios.min} ~ #{ratios.max}"
puts "  average: #{ratios.sum / ratios.length}"

puts "FROGS: #{frogs_case.min} ~ #{frogs_case.max}"
puts "  average: #{frogs_case.sum / frogs_case.length}"

puts "trochia: #{trochia_case.min} ~ #{trochia_case.max}"
puts "  average: #{trochia_case.sum / trochia_case.length}"
