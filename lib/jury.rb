class Jury
 attr_accessor :members

  def initialize
   @members=[]

 end

  def add_member(jury_member)
    @members<<jury_member
  end

 def cast_votes(finalists)

  final_votes = {}
  # add both finalists to hash first, to account for the case
  # when all votes go to a single finalist
  finalists.each { |finalist| final_votes[finalist]=0 }


  @members.each do |member|

   voted_for = finalists.sample

   puts "#{member} voted for #{voted_for.name}"
    final_votes[voted_for]+=1
  end
   final_votes

  end

 def report_votes(final_votes)

   final_votes.each { |finalist, votes| puts "#{finalist}: #{votes}" }
 end

 def announce_winner(final_votes)
   #from: http://stackoverflow.com/questions/6040494/how-to-find-the-key-of-the-largest-value-hash
   winner_name = final_votes.max_by { |finalist, votes| votes }[0]
   puts "Winner  is #{winner_name}!!!".green
   winner_name
 end


end