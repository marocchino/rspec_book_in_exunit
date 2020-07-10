defmodule RspecBook.SandwichTest do
  use ExUnit.Case
  doctest RspecBook.Sandwith
  alias RspecBook.Sandwich

  describe "an ideal sandwich" do
    setup do
      {:ok, sandwich: build(:sandwich) }
    end

    test "is delicious", %{sandwich: sandwich} do
      assert sandwich.taste == "delicious", "Sandwith is not delicious was: #{sandwich.taste}"
    end

    test "lets me add toppings", %{sandwich: sandwich} do
      sandwich = Map.put(sandwich, :toppings, ["cheese" | sandwich.toppings])
      refute Enum.empty?(sandwich.toppings)
    end
  end

  def build(:sandwich), do: %Sandwich{taste: "delicious"}
end
