defmodule RspecBookTest do
  use ExUnit.Case
  doctest RspecBook
  alias RspecBook.Sandwich

  describe "an ideal sandwich" do
    test "is delicious" do
      sandwich = %Sandwich{taste: 'delicious'}
      assert taste == 'delicious'
    end
  end

  def build(:sandwich), do: %{}
end
