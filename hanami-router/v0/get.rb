module Benchmarker
  module V0
    class Get
      def self.index(env)
        [
          200,
          {},
          ['Hello World!']
        ]
      end

      def self.show(env)
        [
          200,
          {},
          ["Routing parameter = #{ env['router.params'][:id] }"]
        ]
      end
    end
  end
end
