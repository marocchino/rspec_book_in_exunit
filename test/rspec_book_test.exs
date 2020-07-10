defmodule RspecBookTest do
  use ExUnit.Case
  doctest RspecBook

  test "greets the world" do
    assert RspecBook.hello() == :world
  end
end
