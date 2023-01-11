module RWX
  class Example
    MyError = Class.new(StandardError)

    def raises_runtime_error
      raise "it raises"
    end

    def raises_custom_error
      raise MyError, "uh oh"
    end

    def returns_one
      1
    end
  end
end
