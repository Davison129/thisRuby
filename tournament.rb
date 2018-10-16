
class Tournament

  attr_accessor :size
  attr_reader :players

  def initialize
    @players = []
    @size = 0
    @total_rating = 0
  end

  def add_player(player)
    @players << player
    @size +=1
  end

  def sort_players # sort players in descending order of score
    @players.sort!{|p1, p2| p1.score <=> p2.score}.reverse!
  end

  def find_total_rating
    @players.each{|player|@total_rating += player.rating}
  end

  def average_rating
    @total_rating / @size
  end

  def print
    puts "Average rating is: #{average_rating}"
    @players.each{|p| puts p.to_s}
  end

end

class Player

  attr_accessor :name, :rating, :results

  def initialize(name, rating, results, tournament)
    @name = name
    @rating = rating
    @results = results
    @tournament = tournament
  end

  def score
    @results.sum
  end

  def average_opponents_ratings
    total_rating = 0
    @tournament.players.each{|player|total_rating += player.rating}
    (total_rating - @rating) / (@tournament.size - 1)
  end

  def expected_score_per_round
    1.0 / (1.0 + 10.0**(average_rating_minus_players/400.0) )
  end

  def average_rating_minus_players
    average_opponents_ratings-@rating
  end

  def new_rating
    @rating + 40 * (score*1.0 - (opponent_size * expected_score_per_round))
  end

  def opponent_size
    @tournament.size - 1
  end

  def to_s
    str = @name + " #{@rating} "
    @results.each {|r| str+=" #{r}"}
    str += " AVG OPPONENT RATING: #{average_opponents_ratings}"
    str += " TOTAL: #{score} points"
    str += " NEW RATING: #{new_rating.to_i}"
  end

end

t = Tournament.new
file = File.new('tournament_results.txt', "r")
while (line = file.gets)
  data =  line.split # so data is an array of strings
  name = data[0]
  rating = data[1].to_i
  results = []
  data[2..data.length].each_with_index{|res,i| results[i]=res.to_i}
  p = Player.new(name, rating, results, t)
  t.add_player(p)
end
t.sort_players
t.print