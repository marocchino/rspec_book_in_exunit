defmodule ExpenseTrackerWeb.ExpensesControllerTest do
  use ExpenseTrackerWeb.ConnCase
  import Mox
  alias ExpenseTracker.Recording
  defmock(RecordingMock, for: Recording.Behaviour)

  describe ".create/2" do
    @expense %{"some" => "data"}
    @invalid_expense %{"some" => "invalid"}
    setup do
      expect(RecordingMock, :record, fn
        @expense -> {:ok, %{id: 417}}
        @invalid_expense -> {:error, %{error: "expense incomplete"}}
      end)

      :ok
    end

    test "it returns id and responds with a 200 (OK) when successfully recorded", %{conn: conn} do
      conn = post(conn, "/expenses", @expense)
      assert json = json_response(conn, 200)
      assert 417 == json["expense_id"]
    end

    test "it returns an error message and responds with a 422 (Unprocessable entity) when the expense fails validation",
         %{conn: conn} do
      conn = post(conn, "/expenses", @invalid_expense)
      assert json = json_response(conn, 422)
      assert "expense incomplete" == json["error"]
    end
  end

  describe ".index/2" do
    @today %{"date" => "2020-08-04"}
    @tomorrow %{"date" => "2020-08-05"}
    setup do
      expect(RecordingMock, :get_all, fn
        @today -> {:ok, [%{id: 417}]}
        @tomorrow -> {:ok, []}
      end)

      :ok
    end

    test "it returns expense records as JSON and responds with a 200 (OK) when expenses exist on the given date",
         %{conn: conn} do
      conn = get(conn, "/expenses/2020-08-04")
      assert json = json_response(conn, 200)
      assert [%{}] = json
    end

    test "it returns empty array as JSON and responds with a 200 (OK) when no expenses on the given date",
         %{conn: conn} do
      conn = get(conn, "/expenses/2020-08-05")
      assert json = json_response(conn, 200)
      assert [] == json
    end
  end
end
