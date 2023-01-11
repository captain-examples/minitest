require "test_helper"

module RWX
  class TestExample < Minitest::Test
    def setup
      @example = Example.new
    end

    def test_raises_runtime_error
      assert_raises RuntimeError do
        @example.raises_runtime_error
      end
    end

    def test_raises_custom_error
      assert_raises Example::MyError do
        @example.raises_custom_error
      end
    end

    def test_returns_one
      assert_equal 1, @example.returns_one
    end

    def test_is_slow
      sleep(1.5)
      assert true
    end
  end
end
