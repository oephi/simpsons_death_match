require 'faker'
require 'espeak'
require 'rainbow'
require_relative 'models/character'
# require_relative 'logic'

@simpsons_character = Character.new(10, Faker::Simpsons.character)

@player = Character.new(10)

def speak(input)     
    speech = ESpeak::Speech.new("#{input}", speed: 120)
    speech.speak
end


def hit_point_tracker
    puts Rainbow("#{@simpsons_character.name} Hit Points: #{@simpsons_character.hit_points}").red
    puts Rainbow("#{@player.name} Hit Points: #{@player.hit_points}").green    
end

def welcome
    speak("Welcome to Simpsons death match, your adversary is #{@simpsons_character.name}.  What is your name?")
    puts "Enter name weakling: "
    player_name = gets.chomp
    @player.name = player_name
    speak("Greetings #{@player.name}.  Because you are weak, you get the first strike")
end

def strike
    
    while true
        player_hit = rand(10)
        character_hit = rand(10)
        if @simpsons_character.hit_points > 0 && @player.hit_points > 0 
            puts "Press enter to strike"
            strike = gets.strip
        end

        if @simpsons_character.hit_points > 0 && @player.hit_points <= 0 
            speak("You are dead.  What the hell were you thinking?")
            return false
        elsif @player.hit_points > 0 && @simpsons_character.hit_points <=0
            speak("You have killed #{@simpsons_character.name} until they were dead.  You ass hole!")
            return false            
        elsif @player.hit_points > 0
            speak("You hit #{@simpsons_character.name} for #{player_hit} points.")

            @simpsons_character.hit_points -= player_hit
            
            if @simpsons_character.hit_points > 0 
                speak("#{@simpsons_character.name} hits you for #{character_hit}")
                
                @player.hit_points -= character_hit
            end
        end
    end
end
    
    

    puts "#{@simpsons_character.name} Hit Points: #{@simpsons_character.hit_points}"
    system 'aplay Simpsons.wav'

def battle_logic
    welcome
    hit_point_tracker
    strike
end

battle_logic





