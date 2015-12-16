describe ZSS::ServiceRegister do
  describe '#get_service' do
    let(:service) { double 'service' }
    let(:helloWorldInstance) { double('instance') }

    before do
      config = Hashie::Mash.new({
        backend: Settings.broker.backend
      })

      expect(ZSS::Service).to receive(:new).with(:"hello-world", config) { service }
      expect(HelloWorldService).to receive(:new) { helloWorldInstance }
    end

    describe 'register service routes' do

      before do
        allow(service).to receive(:add_route)
        described_class.get_service
      end

      specify 'hello_world' do
        expect(service).to have_received(:add_route).with(helloWorldInstance, "HELLO/WORLD", :get)
      end

    end

  end

end
