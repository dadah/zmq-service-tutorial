module Repository
  class Person < Repository::Base

    def get
      DAO::Person.all.map do |person|
        Mapper::Person.map(person)
      end
    end

  end
end
