require "set"
require_relative "player"
class GhostGame
    ALPHABET = Set.new("a".."z")
    MAX_LOSS_COUNT = 5

    def initialize(*players)
        words = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @losses = Hash.new { |loses, player| losses[player = 0]}
    end

    def run
        play_round until game_over?
        puts "#{winner} wins!"
    end


end