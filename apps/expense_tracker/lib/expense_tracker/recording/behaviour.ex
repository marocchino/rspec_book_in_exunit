defmodule ExpenseTracker.Recording.Behaviour do
  @callback record(map) :: {:ok, map} | {:error, any}
end
