module VagrantPlugins
  module ProviderVeertu
    module Action
      class IsSaved
        def initialize(app, env)
          @app = app
        end

        def call(env)
          # Set the result to be true if the machine is saved.
          env[:result] = env[:machine].state.id == :paused

          # Call the next if we have one (but we shouldn't, since this
          # middleware is built to run with the Call-type middlewares)
          @app.call(env)
        end
      end
    end
  end
end
