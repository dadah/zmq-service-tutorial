class PersonService < BaseService

  attr_reader :person_repo

  def initialize
    @person_repo = Repository::Person.new
  end

  def get payload, headers
    persons = person_repo.get()
    if persons.empty?
      raise ZSS::Error.new(404, "No people here")
    else
      persons.map &:serialize
    end
  end

end
