class Game

  attr_reader :tribes

  def initialize(*tribes)
    @tribes=tribes

  end

  def add_tribe(tribe)
    @tribes<<tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(merged_tribe_name)


    merged_members = merge_remaining_members

    @tribes.clear
    merged_tribe = Tribe.new({name: merged_tribe_name, members: merged_members})
    @tribes<<merged_tribe

    merged_tribe


    # merge all the remaining members of tribes and create a new tribe with given name

  end
  def individual_immunity_challenge

    merged_tribe = @tribes.first
    merged_tribe.members.sample

  end



  def merge_remaining_members
    merged_members=[]

    @tribes.each do |tribe|
      merged_members.concat(tribe.members)

    end
    merged_members
  end


  def run_phase1_immunity_challenge(no_of_eliminations)
    eliminated_members = []

    no_of_eliminations.times do
      losing_tribe= immunity_challenge
      immune_member=losing_tribe.members.sample
      eliminated_member= losing_tribe.tribal_council(immune: immune_member)
      losing_tribe.members.delete(eliminated_member)
      eliminated_members<<eliminated_member
    end
    eliminated_members
  end


  def run_individual_immunity_challenges(no_of_eliminations)
    eliminated_members = []
    no_of_eliminations.times do
      immune_member = individual_immunity_challenge
      eliminated_member= tribes.first.tribal_council(immune: immune_member)
      tribes.first.members.delete(eliminated_member)
      eliminated_members<<eliminated_member
    end
    eliminated_members
  end


end