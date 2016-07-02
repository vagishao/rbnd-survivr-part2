class Tribe
  attr_reader :name , :members

  def initialize(options)
    @name=options[:name]
    @members=options[:members]
    puts @name
  end

  def to_s
    @name
  end

  def tribal_council(options)
    immune_member = options[:immune]

    while (member = @members[rand(@members.length)]) == immune_member

    end
    member
  end
end