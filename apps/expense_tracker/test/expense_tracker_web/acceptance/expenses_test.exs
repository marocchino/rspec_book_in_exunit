defmodule ExpenseTracker.ExpensesTest do
  use ExpenseTrackerWeb.ConnCase

  @coffee %{"payee" => "Starbucks", "amount" => 5.75, "date" => "2020-07-28"}
  @zoo %{"payee" => "Zoo", "amount" => 15.25, "date" => "2020-07-28"}
  @groceries %{"payee" => "Whole Foods", "amount" => 95.2, "date" => "2020-07-29"}

  @tag skip: true
  test "it records submitted expenses", %{conn: conn} do
    coffee = post_expense(conn, @coffee)
    zoo = post_expense(conn, @zoo)
    _groceries = post_expense(conn, @groceries)
    conn = get conn, "/expenses/2020-07-28"
    assert json = json_response(conn, 200)
    assert json == [coffee, zoo]
  end

  defp post_expense(conn, params) do
    conn = post conn, "/expenses", params
    assert json = json_response(conn, 200)
    assert is_integer(json["expense_id"])
    Map.put(params, "expense_id", json["expense_id"])
  end
end
