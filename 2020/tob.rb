require_relative 'color'

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


books = [ "All This Could Be Yours", "Nothing to See Here", "Mary Toft; or, the Rabbit Queen", "Golden State", 
    "Optic Nerve", "Girl, Woman, Other", "Lost Children Archive", "Fleishman Is in Trouble", "Your House Will Pay", 
    "The Water Dancer", "On Earth We're Briefly Gorgeous", "Overthrow", "We Cast a Shadow", "Oval", "Saudade", 
    "Normal People", "The Testaments", "Trust Exercise" ]

play_ins = [ "We Cast a Shadow", "Oval", "Golden State" ]
play_in = play_ins.shuffle[0]

zombies = []

s1 = { '1' => "The Testaments", '2' => "Normal People", '3' => "Fleishman Is in Trouble" , '4' => "Saudade" }

s2 = {'1' => "Lost Children Archive",'2' => "Girl, Woman, Other",'3' => "Nothing to See Here",
   '4' => "Mary Toft; or, the Rabbit Queen" }

s3 = {'1' => "The Water Dancer",'2' => "On Earth We're Briefly Gorgeous",'3' => "Your House Will Pay",
   '4' => "Optic Nerve" }

s4 = {'1' => "Trust Exercise",'2' => "All This Could Be Yours",'3' => play_in ,'4' => "Overthrow" }

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
