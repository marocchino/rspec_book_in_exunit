defmodule ExpenseTracker.Recording do
  @behaviour ExpenseTracker.Recording.Behaviour
  import Ecto.Query

  alias ExpenseTracker.Recording.Expense
  alias ExpenseTracker.Repo

  def record(expense) do
    expense
    |> Expense.changeset()
    |> Repo.insert()
  end

  def expenses_on(date) do
    Expense
    |> where(date: ^date)
    |> Repo.all()
    |> (fn data -> {:ok, data} end).()
  end
end
