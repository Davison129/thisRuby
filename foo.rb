# 16382333 Anna Davison
class Test
  def foo
    puts 'foo'
    foobar
  end
  def foobar
    puts 'foobar'
  end
end

class Foo
  def initialize
    @test = Test.new
  end

  def call_foo
    @test.foo
  end
end

thing = Foo.new
thing.call_foo