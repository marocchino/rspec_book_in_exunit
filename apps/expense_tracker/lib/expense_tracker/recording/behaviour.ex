defmodule ExpenseTracker.Recording.Behaviour do
  @callback record(map) :: {:ok, map} | {:error, any}
  @callback get_all(map) :: {:ok, list(map)}
end
