module Rack
  class Chunker
    require_relative "chunker/version"

    attr_reader :bitsize
    private :bitsize

    def initialize(stack, bitsize = false)
      @stack = stack
      @bitsize = bitsize
    end

    def call(previous_state)
      @state = previous_state
      @status, @headers, @body = stack.call(state)

      if body.is_a?(Array)
        [status, headers, body]
      else
        [status, headers, [body]]
      end
    end

    private def stack
      @stack
    end

    private def state
      @state
    end

    private def headers
      @headers
    end

    private def status
      @status
    end

    private def body
      @body
    end
  end
end
