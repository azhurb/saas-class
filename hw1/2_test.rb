require "./2.rb"
require "rubygems"
gem "test-unit"
require "test/unit"

class TestAssertion < Test::Unit::TestCase
  def test_rps_game_winner

    assert_raise WrongNumberOfPlayersError do
      rps_game_winner([["Armando", "P"]])
    end

    assert_raise NoSuchStrategyError do
      rps_game_winner([["Armando", "P"], ["Armando", "Q"]])
    end

    assert_equal rps_game_winner([["Armando", "P"], ["Dave", "S"]]), ["Dave", "S"]
    assert_equal rps_game_winner([["Armando", "R"], ["Dave", "P"]]), ["Dave", "P"]
  end

  def test_rps_tournament_winner

    assert_equal rps_tournament_winner(
                     [
                         [
                             [["Armando", "P"], ["Dave", "S"]],
                             [["Richard", "R"], ["Michael", "S"]],
                         ],
                         [
                             [["Allen", "S"], ["Omer", "P"]],
                             [["David E.", "R"], ["Richard X.", "P"]]
                         ]
                     ]), ["Richard", "R"]

    assert_equal rps_tournament_winner([["Armando", "P"], ["Dave", "S"]]), ["Dave", "S"]

    assert_equal rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]]]]), ["Dave", "S"]

    assert_equal rps_tournament_winner(
                     [
                         [
                             [
                                 [["Armando", "P"], ["Dave", "S"]],
                                 [["Richard", "R"], ["Michael", "S"]],
                             ],
                             [
                                 [["1Allen", "S"], ["1Omer", "P"]],
                                 [["1David E.", "R"], ["1Richard X.", "P"]]
                             ]
                         ],
                         [
                             [
                                 [["2Allen", "S"], ["2Omer", "P"]],
                                 [["2David E.", "R"], ["2Richard X.", "P"]]
                             ],
                             [
                                 [["3Allen", "S"], ["3Omer", "P"]],
                                 [["3David E.", "R"], ["3Richard X.", "P"]]
                             ]
                         ]
                     ]), ["Richard", "R"]

    assert_equal rps_tournament_winner(
                     [
                         [
                             [
                                 [
                                     [["Armando", "P"], ["Dave", "S"]],
                                     [["Richard", "R"], ["Michael", "S"]],
                                 ],
                                 [
                                     [["1Allen", "S"], ["1Omer", "P"]],
                                     [["1David E.", "R"], ["1Richard X.", "P"]]
                                 ]
                             ],
                             [
                                 [
                                     [["2Allen", "S"], ["2Omer", "P"]],
                                     [["2David E.", "R"], ["2Richard X.", "P"]]
                                 ],
                                 [
                                     [["3Allen", "S"], ["3Omer", "P"]],
                                     [["3David E.", "R"], ["3Richard X.", "P"]]
                                 ]
                             ]
                         ],
                         [
                             [
                                 [
                                     [["Armando", "P"], ["Dave", "S"]],
                                     [["Richard", "R"], ["Michael", "S"]],
                                 ],
                                 [
                                     [["1Allen", "S"], ["1Omer", "P"]],
                                     [["1David E.", "R"], ["1Richard X.", "P"]]
                                 ]
                             ],
                             [
                                 [
                                     [["2Allen", "S"], ["2Omer", "P"]],
                                     [["2David E.", "R"], ["2Richard X.", "P"]]
                                 ],
                                 [
                                     [["3Allen", "S"], ["3Omer", "P"]],
                                     [["3David E.", "R"], ["3Richard X.", "P"]]
                                 ]
                             ]
                         ]

                     ]), ["Richard", "R"]


  end
end