# frozen_string_literal: true

require "test_helper"
require "stringio"
require_relative "../../experiments/secret_input"

class SecretInputTest < Minitest::Test
  def test_read_secret_chomps_non_tty_input
    assert_equal "hunter2", read_secret(StringIO.new("hunter2\n"))
  end

  def test_read_secret_handles_eof
    assert_equal "", read_secret(StringIO.new(""))
  end

  def test_prompt_new_password_requires_match
    out, = capture_io do
      assert_equal "good", prompt_new_password(StringIO.new("a\nb\ngood\ngood\n"))
    end
    assert_match(/did not match/, out)
  end

  def test_prompt_new_password_rejects_empty
    capture_io do
      assert_equal "pw", prompt_new_password(StringIO.new("\n\npw\npw\n"))
    end
  end
end
