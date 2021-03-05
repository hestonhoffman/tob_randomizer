require_relative 'color'
require 'yaml'
require 'pp'


def winner1_4(seed)
    array = []
    array << ([seed['1'], seed['4']]).shuffle.pop
    array[0]
end

def winner2_3(seed)
    array = []
    array << ([seed['2'], seed['3']]).shuffle.pop
    array[0]
end

def faceoff(one, two)
    [one, two].shuffle.pop
end

def zombifier(books, semi1, semi2)
    array = []
    zombies = []
    i = 1
    books.each do |book|
        if book != semi1[0] && book != semi2[0]
            array << book.yellow 
        end
    end
    array = array.shuffle
    array[0..1]
end

def strip_books(hash)
  array = []
  hash.each do |key, value|
    value.each do |k, book|
      array << book if book != nil
    end
    array = array + value if value.is_a?(Array)
  end
  array
end    

books_hash = YAML.safe_load(File.open('books.yaml'))
books = strip_books(books_hash)

play_ins = books_hash['Play-ins']
play_in = play_ins.shuffle[0]

zombies = []

s1 = { '1' => books_hash['S1'][1], 
       '2' => books_hash['S1'][2], 
       '3' => books_hash['S1'][3], 
       '4' => books_hash['S1'][4] }

s2 = {'1' => books_hash['S2'][1],
      '2' => books_hash['S2'][2],
      '3' => books_hash['S2'][3],
      '4' => books_hash['S2'][4] }

s3 = {'1' => books_hash['S3'][1],
      '2' => books_hash['S3'][2],
      '3' => books_hash['S3'][3],
      '4' => books_hash['S3'][4] }

s4 = {'1' => books_hash['S4'][1],
      '2' => books_hash['S4'][2],
      '3' => books_hash['S4'][3],
      '4' => play_in }   

puts "The play-in winner is: #{play_in.yellow}"
puts

puts "-- Round of 16 --"
s1a = winner1_4(s1)
s1b = winner2_3(s1)
s2a = winner1_4(s2)
s2b = winner2_3(s2)
s3a = winner1_4(s3)
s3b = winner2_3(s3)
s4a = winner1_4(s4)
s4b = winner2_3(s4)

puts "#{s1['1'].green} vs #{s1['4'].pink}. ----- The winner is: #{s1a.light_blue}!!!!"
puts "#{s1['2'].green} vs #{s1['3'].pink}. ----- The winner is: #{s1b.light_blue}!!!!"
puts "#{s2['1'].green} vs #{s2['4'].pink}. ----- The winner is: #{s2a.light_blue}!!!!"
puts "#{s2['2'].green} vs #{s2['3'].pink}. ----- The winner is: #{s2b.light_blue}!!!!"
puts "#{s3['1'].green} vs #{s3['4'].pink}. ----- The winner is: #{s3a.light_blue}!!!!"
puts "#{s3['2'].green} vs #{s3['3'].pink}. ----- The winner is: #{s3b.light_blue}!!!!"
puts "#{s4['1'].green} vs #{s4['4'].pink}. ----- The winner is: #{s4a.light_blue}!!!!"
puts "#{s4['2'].green} vs #{s4['3'].pink}. ----- The winner is: #{s4b.light_blue}!!!!"
puts

puts "-- Round of 8 --"
s1 = faceoff(s1a, s1b)
s2 = faceoff(s2a, s2b)
s3 = faceoff(s3a, s3b)
s4 = faceoff(s4a, s4b)

puts "It's #{s1a.green} vs #{s1b.pink}. ----- The winner is: #{s1.light_blue}!!!!!"
puts "It's #{s2a.green} vs #{s2b.pink}. ----- The winner is: #{s2.light_blue}!!!!!"
puts "It's #{s3a.green} vs #{s3b.pink}. ----- The winner is: #{s3.light_blue}!!!!!"
puts "It's #{s4a.green} vs #{s4b.pink}. ----- The winner is: #{s4.light_blue}!!!!!"
puts

puts "-- It's the semi-finals!!!! --"
semi1 = faceoff(s1,s2)
semi2 = faceoff(s3,s4)

puts "It's #{s1.green} vs #{s2.pink}: ----- The winner is: #{semi1.light_blue}"
puts "It's #{s3.green} vs #{s4.pink}: ----- The winner is: #{semi2.light_blue}"
puts

puts ("The zombies are here!").red
zombies = zombifier(books, semi1, semi2)
puts zombies
puts

puts "-- Look out, it's the zombie round! Braaaaainnnnnsss! --"
fin1 = faceoff(zombies[0], semi1)
fin2 = faceoff(zombies[1], semi2)
puts
puts "Finalist 1: #{fin1.light_blue}"
puts "Finalist 2: #{fin2.pink}"
puts

puts "-- It's the Final!!! --"
winner = faceoff(fin1, fin2)
puts
puts "The winner is: #{winner.yellow}"