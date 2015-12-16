module Mapper
  class Person < Mapper::Base

    def self.to_dao dto_instance
      DAO::Person.new id: dto_instance.id, name: dto_instance.name
    end

    def self.to_dto dao_instance
      DTO::Person.new id: dao_instance.id, name: dao_instance.name
    end

  end
end
