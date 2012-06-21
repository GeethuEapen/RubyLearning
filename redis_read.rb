require 'rubygems'
require 'redis'


$redis1 = Redis.new


def set_value
  $redis1.set( "name", "litty")
  $redis1.set( "age" , 21)
end


def get_value
  p $redis1.get( "name")
  p $redis1.get( "age")
end


def run
  set_value
  get_value
end


run
