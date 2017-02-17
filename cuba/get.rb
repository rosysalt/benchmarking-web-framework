module Benchmarker
  class Get < Cuba
  end

  Get.define do
    on get do
      on 'books' do
        on ':id' do |id|
          res.write "Routing parameter = #{id}"
        end

        res.write 'Hello World!'
      end
    end
  end
end
