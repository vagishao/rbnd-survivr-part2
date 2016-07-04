class Jury
 attr_accessor :members

  def initialize
   @members=[]

 end

  def add_member(jury_member)
    @members<<jury_member
  end

 def cast_votes(finalists)
  final_votes = Hash.new(0)
  @members.each do

    voted_for = finalists.sample
   puts voted_for
    final_votes[voted_for]+=1
  end
   final_votes

  end

 def report_votes(final_votes)

   final_votes.each { |k,v| puts v }
 end

 def announce_winner(final_votes)
   #from: http://stackoverflow.com/questions/6040494/how-to-find-the-key-of-the-largest-value-hash
   winner_name = final_votes.max_by{ |k,v| v }[0]
   puts "Winner  is #{winner_name}!!!".green
   winner_name
 end


end