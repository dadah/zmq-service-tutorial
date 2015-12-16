module ZSS
  class ServiceRegister

    def self.get_service
      config = Hashie::Mash.new(
        backend: Settings.broker.backend
      )

      service = ZSS::Service.new(:person, config)

      personInstance = PersonService.new

      service.add_route(personInstance, :get)

      service
    end

  end
end
