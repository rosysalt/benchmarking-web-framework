require_relative '../common'

module Benchmarker
  module V0
    class Tea < Common
      get 'additions' do
        'honey lemon mint cinnamon lavender ginger'
      end

      get 'types' do
        'black green herbal'
      end
    end
  end
end
