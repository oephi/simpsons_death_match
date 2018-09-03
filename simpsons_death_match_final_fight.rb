require 'faker'
require 'espeak'
require 'rainbow'
require "catpix"
require_relative 'models/character'
require_relative 'logic'


##########################  Application ##############################

## Instantiate character classes
@simpsons_character = Character.new(15, Faker::Simpsons.character)
@player = Character.new(1)

## Simpsons Death Match Image
Catpix::print_image "Simpsons-Death-Match.jpg",
:limit_x => 1.0,
:limit_y => 0,
:center_x => true,
:center_y => true,
:bg => "white",
:bg_fill => true,
:resolution => "low"

#Simpson Theme Song
system 'aplay Simpsons.wav'

welcome
battle_logic






