require 'bundler/setup'
require 'colorizr'
class Tribe
  attr_reader :name , :members

  def initialize(options)
    @name=options[:name]
    @members=options[:members]
    puts @name.red
  end

  def to_s
    @name
  end

  def tribal_council(options)
    immune_member = options[:immune]


    #there is no immune member in phase 1 challenges
    if immune_member.nil?
      eliminated_member = @members.sample
    else
      eliminated_member = @members.reject { |member| member == immune_member }.sample
    end

    @members.delete(eliminated_member)

    eliminated_member


  end


end