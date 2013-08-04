Code.require_file "test_helper.exs", __DIR__

defmodule CliTest do
  use ExUnit.Case

  test "nil returned by option parsing with -h and --help options" do
    assert Issues.CLI.parse_args(["-h",     "anything"]) == :help
    assert Issues.CLI.parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert Issues.CLI.parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end

  test "count is defaulted if two values given" do
    assert Issues.CLI.parse_args(["user", "project"]) == { "user", "project", 4 }
  end
end
