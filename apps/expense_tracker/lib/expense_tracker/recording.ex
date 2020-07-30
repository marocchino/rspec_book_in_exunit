defmodule ExpenseTracker.Recording do
  @behaviour ExpenseTracker.Recording.Behaviour
  def record(_), do: {:ok, %{}}
end
