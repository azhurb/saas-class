class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  strategy = ["R", "S", "P"]
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError if game.any? { |s| strategy.index(s[1]) == nil }

  wins = {'RS' => 'R', 'PS' => 'S', 'PR' => 'P'}
  map = game.map {|m| m[1]}.sort.join
  return game[0] if wins[map] == nil
  game.delete_if {|x| x[1] != wins[map]}[0]
end

def rps_tournament_winner(tournament)
  #rps_game_winner(tournament.map {|games| rps_game_winner(games.map {|game| rps_game_winner(game)})})

  if tournament.length == 1
    tournament.map {|games| rps_game_winner(games.map {|game| rps_game_winner(game)})}.at(0)
  elsif tournament.length == 2
    #print tournament
    rps_game_winner(tournament.map {|games| rps_game_winner(games.map {|game| rps_game_winner(game)})})
  elsif tournament.length > 2

    one = tournament.slice!(0, tournament.length/2)
    two = tournament.slice!(tournament.length/2, tournament.length/2)

    rps_tournament_winner(one)
    #rps_tournament_winner(two)
  end

end
