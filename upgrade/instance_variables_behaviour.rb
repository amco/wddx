

class A
  def initialize
    @name = "Stefan"
    @last = "Saasen"
    @num = 10
    @z = :r
    @ary = [1,2]
  end
end

class B
  def initialize
    @z = :r
    @last = "Saasen"
    @ary = [1,2]
    @name = "Stefan"
    @num = 5
  end
end

puts "Ruby Version #{RUBY_VERSION}"

p A.new.instance_variables.sort
p B.new.instance_variables.sort

