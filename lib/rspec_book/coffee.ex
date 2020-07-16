defmodule RspecBook.Coffee do
  defstruct ingredients: []

  def add(coffee, ingredient) do
    Map.put(coffee, :ingredients, [ingredient | coffee.ingredients])
  end

  def price(coffee) do
    1.00 + length(coffee.ingredients) * 0.25
  end

  def color(coffee) do
    case :milk in coffee.ingredients do
      true -> :light
      false -> :dark
    end
  end

  def temperature(coffee) do
    case :milk in coffee.ingredients do
      true -> 190.0
      false -> 205.0
    end
  end
end
