defmodule RspecBook.CoffeeTest do
  use ExUnit.Case
  doctest RspecBook.Coffee
  alias RspecBook.Coffee

  setup do
    {:ok, coffee: %Coffee{}}
  end

  test "it costs $1", %{coffee: coffee} do
    assert Coffee.price(coffee) == 1.00
  end

  describe "with milk" do
    setup %{coffee: coffee} do
      {:ok, coffee: Coffee.add(coffee, :milk)}
    end

    test "it costs $1.25", %{coffee: coffee} do
      assert Coffee.price(coffee) == 1.25
    end

    test 'it is light in color', %{coffee: coffee} do
      assert Coffee.color(coffee) == :light
    end

    test 'it cooler than 200 degrees Fahrenheit', %{coffee: coffee} do
      assert Coffee.temperature(coffee) < 200.0
    end
  end
end
