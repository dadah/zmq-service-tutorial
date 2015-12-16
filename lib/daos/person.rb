module DAO
  class Person < ActiveRecord::Base
    self.table_name = 'persons'
  end
end
