require 'faker'
require 'espeak'

system 'aplay Simpsons.wav'
simpsons_Character = Character.new (5, Faker::Simpsons)
@character = dw.character
@character_hit_points = 5
@player_hit_points = 5
p @character

welcome = "Welcome to Simpsons death match, your adversary is #{@character}.  What is your name?"
speech = ESpeak::Speech.new("#{welcome}", speed: 120)
speech.speak


# puts "Enter thy name maggot: "
# @player = gets.strip

# greetings = "Greetings #{@player}.  Because you are weak, you get the first strike"
# speech = ESpeak::Speech.new("#{greetings}", speed: 100)
# speech.speak

# def battle
#     puts "#{@character} Hit Points: #{@character_hit_points}"
#     puts "#{@player} Hit Points: #{@player_hit_points}"
 
#     puts "Press enter to strike"
#     strike = gets.strip
#     player_hit = rand(10)
#     character_hit = rand(10)
#     player_hit_speak = "You hit #{@character} for #{player_hit} points."  
#     character_hit_speak = "#{@character} hits you for #{character_hit}"
#     speech = ESpeak::Speech.new("#{player_hit_speak}", speed: 100)
#     speech.speak
#     speech = ESpeak::Speech.new("#{character_hit_speak}", speed: 100)
#     speech.speak
#     @character_hit_points -= player_hit
#     @player_hit_points -= character_hit
# end

# def death
#     if @character_hit_points <= 0
#         character_dies = "You have killed #{@character} until they were dead.  You ass hole!"
#         speech = ESpeak::Speech.new("#{character_dies}", speed: 100)
#         speech.speak
#     elsif @player_hit_points <= 0
#         player_dies = "You are dead.  What the hell were you thinking?"
#         speech = ESpeak::Speech.new("#{player_dies}", speed: 100)
#         speech.speak
#     end
# end

# while @character_hit_points > 0 && @player_hit_points > 0 do
#     if @character_hit_points > 0 && @player_hit_points > 0
#         battle
#     else @character_hit_points <= 0 || @player_hit_points <= 0
#         death
#     end
# end

