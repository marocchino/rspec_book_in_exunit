defmodule ExpenseTrackerWeb.ExpensesController do
  use ExpenseTrackerWeb, :controller
  alias Plug.Conn

  def create(conn, params) do
    case recording().record(params) do
      {:ok, %{id: id}} ->
        json(conn, %{expense_id: id})

      {:error, error} ->
        Conn.put_status(conn, :unprocessable_entity)
        |> json(error)
    end
  end

  def index(conn, _params) do
    json(conn, [])
  end

  defp recording, do: Application.get_env(:expense_tracker, :behaviour)[:recording]
end
