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

def zombifier(semi1, semi2, books)
  array = [books[semi1], books[semi2]]
end


books = { 
    "Cloud Atlas" => "The Plot Against America", 
    "The Accidental" => "Home Land", 
    "The Road" => "Absurdistan",
    "The Brief Wondrous Life of Oscar Wao" => "Remainder",
    "A Mercy" => "City of Refuge", 
    "Wolf Hall" => "The Lacuna", 
    "A Visit From the Goon Squad" => "Freedom",
    "The Sisters Brothers" => "Open City",
    "The Orphan Master’s Son" => "The Fault in Our Stars", 
    "The Good Lord Bird" => "Life After Life", 
    "Station Eleven" => "All the Light We Cannot See",
    "The Sellout" => "The Turner House",
    "The Underground Railroad" => "Homegoing", 
    "Fever Dream" => "Lincoln in the Bardo", 
    "My Sister, the Serial Killer" => "Warlight",
    "Normal People" => "Optic Nerve",
}

s1 = { 
    '1' => "Cloud Atlas", 
    '2' => "The Road", 
    '3' => "The Brief Wondrous Life of Oscar Wao" , 
    '4' => "The Accidental" 
}

s2 = {
    '1' => "A Mercy",
    '2' => "A Visit From the Goon Squad",
    '3' => "The Sisters Brothers",
    '4' => "Wolf Hall"
}

s3 = {
    '1' => "The Orphan Master’s Son",
    '2' => "Station Eleven",
    '3' => "The Sellout",
    '4' => "The Good Lord Bird" 
}

s4 = {
    '1' => "The Underground Railroad",
    '2' => "My Sister, the Serial Killer",
    '3' => "Normal People",
    '4' => "Fever Dream"
}

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
zombies = zombifier(semi1, semi2, books)
puts zombies
puts

puts "-- Look out, it's the zombie round! Braaaaainnnnnsss! --"
fin1 = faceoff(zombies[0], semi1)
fin2 = faceoff(zombies[1], semi2)
puts
puts "It's #{zombies[0].green} vs #{semi1.pink}: ----- The winner is: #{fin1.light_blue}"
puts "It's #{zombies[1].green} vs #{semi2.pink}: ----- The winner is: #{fin2.light_blue}"
puts
puts "-- It's the Final!!! --"
puts
puts "Finalist 1: #{fin1.light_blue}"
puts "Finalist 2: #{fin2.pink}"


winner = faceoff(fin1, fin2)
puts
puts "The winner is: #{winner.yellow}"
