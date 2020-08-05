defmodule ExpenseTrackerWeb.ExpensesController do
  use ExpenseTrackerWeb, :controller
  alias Plug.Conn
  alias ExpenseTracker.Recording

  def create(conn, params) do
    case recording(conn).record(params) do
      {:ok, %{id: id}} ->
        json(conn, %{expense_id: id})

      {:error, error} ->
        Conn.put_status(conn, :unprocessable_entity)
        |> json(error)
    end
  end

  def index(conn, params) do
    {:ok, data} = recording(conn).get_all(params)
    json(conn, data)
  end

  defp recording(conn), do: conn.private[:recording] || Recording
end
