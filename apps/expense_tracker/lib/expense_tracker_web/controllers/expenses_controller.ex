defmodule ExpenseTrackerWeb.ExpensesController do
  use ExpenseTrackerWeb, :controller

  def create(conn, _params) do
    json(conn, %{expense_id: 42})
  end

  def index(conn, _params) do
    json(conn, [])
  end
end
