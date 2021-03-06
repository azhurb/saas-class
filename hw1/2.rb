class WrongNumberOfPlayersError < StandardError;
end
class NoSuchStrategyError < StandardError;
end

def rps_game_winner(game)
  strategy = ["R", "S", "P"]
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError if game.any? { |s| strategy.index(s[1]) == nil }

  wins = {'RS' => 'R', 'PS' => 'S', 'PR' => 'P'}
  map = game.map { |m| m[1] }.sort.join
  return game[0] if wins[map] == nil
  game.delete_if { |x| x[1] != wins[map] }[0]
end

def rps_tournament_winner(tournament)

  unless tournament[0][0].kind_of?(Array)
    return rps_game_winner(tournament)
  end

  if tournament[0].length == 1
    return rps_game_winner(tournament[0][0])
  end

  if tournament.length == 1
    tournament.map { |games| rps_game_winner(games.map { |game| rps_game_winner(game) }) }.at(0)
  elsif tournament[0][0][0][0].kind_of?(Array)
    rps_game_winner [rps_tournament_winner(tournament[0]),
                     rps_tournament_winner(tournament[1])]
  elsif tournament[0][0][0][0][0].kind_of?(Array)
    rps_game_winner [rps_tournament_winner(tournament[0]),
                     rps_tournament_winner(tournament[1])]
  elsif tournament.length == 2
    rps_game_winner(tournament.map { |games| rps_game_winner(games.map { |game| rps_game_winner(game) }) })
  end

end
