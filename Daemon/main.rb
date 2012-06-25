require 'rubygems'
require 'daemons'
require 'json'
require 'redis'


$redis1 = Redis.new


def generator
  loop do
    x = {'id' => rand(2000), "updated_at" => Time.now.to_s}.to_json
    $redis1.set( "DaemonTest", x)
    sleep(5)
  end
end


generator
