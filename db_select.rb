require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
:adapter => "mysql",
:host => "localhost",
:user => "root",
:password => "aspirine",
:database => "test"
)


class Base1 < ActiveRecord::Base
  self.table_name = "base"
end


def sel_all
  list = Base1.all
  p 'List of all rows'
  p list
end 


def sel_few
  list2 = []
  list2 = Base1.all(:conditions => {:combo => "PRE3G105"})
  p 'List of all rows with combo = PRE3G105'
  p list2
end

def sel_few_conds
  list3 = []
  list3 = Base1.all(:conditions => {:msisdn => "8943914008", :combo => "PRE3G105", :vas => "PRE3G204"}) 
  p 'List of all rows with combo = PRE3G105 and vas = PRE3G204'
  p list3
end


def run
  sel_all
  sel_few
  sel_few_conds
end

run
