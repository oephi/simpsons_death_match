require 'rainbow'
require 'catpix'
##Application methods

## Method for ESpeak
def speak(input)     
    speech = ESpeak::Speech.new("#{input}", voice: "en", speed: 120)
    speech.speak
end

## Track the hit points of the characters
def hit_point_tracker
    puts Rainbow("#{@simpsons_character.name} Hit Points: #{@simpsons_character.hit_points}").red
    puts Rainbow("#{@player.name} Hit Points: #{@player.hit_points}").green    
end

## The welcome message.  Acquires the name of the player
def welcome
    speak("Welcome to Simpsons death match, your adversary is #{@simpsons_character.name}.  What is your name?")
    puts Rainbow("Enter name weakling: ").yellow
    player_name = gets.chomp
    @player.name = player_name
    speak("Greetings #{@player.name}.  Because you are weak, you get the first strike")
end

## The fight sequence logic
def battle_logic 
    while true
        player_hit = rand(10)
        character_hit = rand(5..10)
        hit_point_tracker
        
        ## Get input for strike or block
        if @simpsons_character.hit_points > 0 && @player.hit_points > 0 
            puts "Press 's' to strike or 'b' to block"
            strike_or_block = gets.strip
        end
        
        ## Strike logic
        if strike_or_block == 's'
            
            ## Character Death sequence
            if @simpsons_character.hit_points > 0 && @player.hit_points <= 0 
                speak("You are dead.  What the hell were you thinking?")
                you_died                
                system 'aplay ending.wav'
                return false
            elsif @player.hit_points > 0 && @simpsons_character.hit_points <=0
                speak("You have killed #{@simpsons_character.name} until they were dead.  You ass hole!")
                system 'aplay ending.wav'
                return false

            end

            ## Strike sequence
            if @player.hit_points > 0
                speak("You hit #{@simpsons_character.name} for #{player_hit} points.")

                @simpsons_character.hit_points -= player_hit
                
                if @simpsons_character.hit_points > 0 
                    speak("#{@simpsons_character.name} hits you for #{character_hit}")
                    
                    @player.hit_points -= character_hit
                end
            end
        end

        #block logic
        if strike_or_block == 'b'
            player_block = rand(1..character_hit)
            
            ## Death sequence
            if @simpsons_character.hit_points > 0 && @player.hit_points <= 0 
                speak("You are dead.  What the hell were you thinking?")
                you_died
                system 'aplay ending.wav'
                return false
            elsif @player.hit_points > 0 && @simpsons_character.hit_points <=0
                speak("You have killed #{@simpsons_character.name} until they were dead.  You ass hole!")
                system 'aplay ending.wav'            
                return false
            ## Block sequence
            elsif @simpsons_character.hit_points > 0 || @player.hit_points > 0 
                speak("#{@simpsons_character.name} hits you for #{character_hit}")
                speak("You blocked #{@simpsons_character.name} for #{player_block} points.")
                @player.hit_points -= (character_hit - player_block)               
            
            end
        end
    end
end

def you_died
    Catpix::print_image "youdied.jpg",
    :limit_x => 1.0,
    :limit_y => 0,
    :center_x => true,
    :center_y => true,
    :bg => "white",
    :bg_fill => true,
    :resolution => "low"
end



