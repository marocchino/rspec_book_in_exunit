defmodule ExpenseTrackerWeb.ExpensesControllerTest do
  use ExpenseTrackerWeb.ConnCase
  import Mox
  alias ExpenseTracker.Recording

  describe ".create/2" do
    @expense %{"some" => "data"}
    @invalid_expense %{"some" => "invalid"}
    defmock(RecordingMock, for: Recording.Behaviour)
    setup do
      expect(RecordingMock, :record, fn
        @expense -> {:ok, %{id: 417}}
        @invalid_expense -> {:error, %{error: "expense incomplete"}}
      end)
      :ok
    end

    test "it returns id and responds with a 200 (OK) when successfully recorded", %{conn: conn} do
      conn = post conn, "/expenses", @expense
      assert json = json_response(conn, 200)
      assert 417 == json["expense_id"]
    end

    test "it returns an error message and responds with a 422 (Unprocessable entity) when the expense fails validation", %{conn: conn} do
      conn = post conn, "/expenses", @invalid_expense
      assert json = json_response(conn, 422)
      assert "expense incomplete" == json["error"]
    end
  end
end
