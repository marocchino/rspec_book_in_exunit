defmodule ExpenseTracker.Recording.Behaviour do
  alias ExpenseTracker.Recording.Expense
  alias Ecto.Changeset

  @callback record(map) :: {:ok, Expense.t()} | {:error, Changeset.t()}
  @callback expenses_on(map) :: {:ok, list(Expense.t())}
end
