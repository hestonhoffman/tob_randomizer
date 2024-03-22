# frozen_string_literal: true

require_relative 'color'
require 'yaml'
require 'pp'

def winner1and4(seed)
  array = [[seed['1'], seed['4']]]
  array[0].shuffle.pop
end

def winner2and3(seed)
  array = [[seed['2'], seed['3']]]
  array[0].shuffle.pop
end

def faceoff(one, two)
  [one, two].shuffle.pop
end

def zombifier(books, semi1, semi2)
  array = []
  books.each do |book|
    array << book.yellow if book != semi1[0] && book != semi2[0]
  end
  array = array.shuffle
  array[0..1]
end

def strip_books(hash)
  array = []
  hash.each do |_key, value|
    value.each do |_k, book|
      array << book unless book.nil?
    end
    array += value if value.is_a?(Array)
  end
  array
end

def judges
  a = rand(1..16)
  b = 17 - a
  if a > b
    puts "Votes: #{a}/#{b}"
  else
    puts "Votes: #{b}/#{a}"
  end
end

books_hash = YAML.safe_load(File.open('books.yaml'))
books = strip_books(books_hash)

play_ins = books_hash['Play-ins']
play_in = play_ins.sample

s1 = { '1' => books_hash['S1'][1],
       '2' => books_hash['S1'][2],
       '3' => books_hash['S1'][3],
       '4' => books_hash['S1'][4] }

s2 = { '1' => books_hash['S2'][1],
       '2' => books_hash['S2'][2],
       '3' => books_hash['S2'][3],
       '4' => books_hash['S2'][4] }

s3 = { '1' => books_hash['S3'][1],
       '2' => books_hash['S3'][2],
       '3' => books_hash['S3'][3],
       '4' => books_hash['S3'][4] }

s4 = { '1' => books_hash['S4'][1],
       '2' => books_hash['S4'][2],
       '3' => books_hash['S4'][3],
       '4' => play_in }

puts "The play-in winner is: #{play_in.yellow}"
puts

puts '-- Round of 16 --'
s1a = winner1and4(s1)
s1b = winner2and3(s1)
s2a = winner1and4(s2)
s2b = winner2and3(s2)
s3a = winner1and4(s3)
s3b = winner2and3(s3)
s4a = winner1and4(s4)
s4b = winner2and3(s4)

puts "#{s1['1'].green} vs #{s1['4'].pink}. ----- The winner is: #{s1a.light_blue}!!!!"
puts "#{s1['2'].green} vs #{s1['3'].pink}. ----- The winner is: #{s1b.light_blue}!!!!"
puts "#{s2['1'].green} vs #{s2['4'].pink}. ----- The winner is: #{s2a.light_blue}!!!!"
puts "#{s2['2'].green} vs #{s2['3'].pink}. ----- The winner is: #{s2b.light_blue}!!!!"
puts "#{s3['1'].green} vs #{s3['4'].pink}. ----- The winner is: #{s3a.light_blue}!!!!"
puts "#{s3['2'].green} vs #{s3['3'].pink}. ----- The winner is: #{s3b.light_blue}!!!!"
puts "#{s4['1'].green} vs #{s4['4'].pink}. ----- The winner is: #{s4a.light_blue}!!!!"
puts "#{s4['2'].green} vs #{s4['3'].pink}. ----- The winner is: #{s4b.light_blue}!!!!"

puts
puts '-- Round of 8 --'
s1 = faceoff(s1a, s1b)
s2 = faceoff(s2a, s2b)
s3 = faceoff(s3a, s3b)
s4 = faceoff(s4a, s4b)

puts "It's #{s1a.green} vs #{s1b.pink}. ----- The winner is: #{s1.light_blue}!!!!!"
puts "It's #{s2a.green} vs #{s2b.pink}. ----- The winner is: #{s2.light_blue}!!!!!"
puts "It's #{s3a.green} vs #{s3b.pink}. ----- The winner is: #{s3.light_blue}!!!!!"
puts "It's #{s4a.green} vs #{s4b.pink}. ----- The winner is: #{s4.light_blue}!!!!!\n"

puts
puts "-- It's the semi-finals!!!! --"
semi1 = faceoff(s1, s2)
semi2 = faceoff(s3, s4)

puts "It's #{s1.green} vs #{s2.pink}: ----- The winner is: #{semi1.light_blue}"
puts "It's #{s3.green} vs #{s4.pink}: ----- The winner is: #{semi2.light_blue}"
puts

puts 'The zombies are here!'.red
zombies = zombifier(books, semi1, semi2)
puts zombies
puts

puts "-- Look out, it's the zombie round! Braaaaainnnnnsss! --".red
puts "#{semi1.light_blue} is facing off against the zombified remains of #{zombies[0].red}"
puts "#{semi2.light_blue} is attempting to slay #{zombies[1].red}"
puts

fin1 = faceoff(zombies[0], semi1)
fin2 = faceoff(zombies[1], semi2)

if fin1 == zombies[0]
  puts "Oh the humanity! #{fin1.red} has defeated #{semi1.light_blue}"
else
  puts "Phew! #{fin1.light_blue} has defeated #{zombies[0].red}"
end

if fin2 == zombies[1]
  puts "Oh dear! #{fin2.red} has defeated #{semi2.light_blue}"
else
  puts "Phew! #{fin2.light_blue} has defeated #{zombies[1].red}"
end

puts
puts "Finalist 1: #{fin1.light_blue}"
puts "Finalist 2: #{fin2.pink}\n"
puts

puts "-- It's the Final!!! --"
winner = faceoff(fin1, fin2)

puts "The winner is: #{winner.pink}!"
judges
