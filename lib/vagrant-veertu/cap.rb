module VagrantPlugins
  module ProviderVeertu
    module Cap
      # Reads the forwarded ports that currently exist on the machine
      # itself. This raises an exception if the machine isn't running.
      #
      # This also may not match up with configured forwarded ports, because
      # Vagrant auto port collision fixing may have taken place.
      #
      # @return [Hash<Integer, Integer>] Host => Guest port mappings.
      def self.forwarded_ports(machine)
        return nil if machine.state.id != :running

        {}.tap do |result|
          machine.provider.driver.read_forwarded_ports.each do |_, _, h, g|
            result[h] = g
          end
        end
      end
      
    end
  end
end
