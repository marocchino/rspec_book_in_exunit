defmodule RspecBook.SlowTest do
  use ExUnit.Case

  @tag :perf
  test "it can sleep for 0.1 second", do: Process.sleep(100)
  @tag :perf
  test "it can sleep for 0.2 second", do: Process.sleep(200)
  @tag :perf
  test "it can sleep for 0.3 second", do: Process.sleep(300)
  @tag :perf
  test "it can sleep for 0.4 second", do: Process.sleep(400)
  @tag :perf
  test "it can sleep for 0.5 second", do: Process.sleep(500)
end
