defmodule RspecBook.TeaTest do
  use ExUnit.Case
  doctest RspecBook.Tea
  alias RspecBook.Tea

  setup do
    {:ok, tea: %Tea{}}
  end

  test "it tastes like Earl Grey", %{tea: tea} do
    assert Tea.flavor(tea) == :earl_grey
  end

  test "it is hot", %{tea: tea} do
    assert Tea.temperature(tea) > 200.0
  end
end
