defmodule ExpenseTracker.RecordingTest do
  use ExpenseTracker.DataCase, async: true
  alias ExpenseTracker.Recording
  alias ExpenseTracker.Recording.Expense
  alias ExpenseTracker.Repo

  describe ".record/1" do
    @expense %{
      "payee" => "Starbucks",
      "amount" => 5.75,
      "date" => "2020-08-11"
    }
    test "successfully saves the expense in the DB with valid expense" do
      assert {:ok, result} = Recording.record(@expense)
      assert [%Expense{payee: "Starbucks", amount: 5.75, date: ~D[2020-08-11]} = result] == Repo.all(Expense)
    end

    @expense %{
      "amount" => 5.75,
      "date" => "2020-08-11"
    }
    test "rejects the expecse as invalid when the expense lacks a payee" do
      assert {:error, changeset} = Recording.record(@expense)
      assert %{payee: ["can't be blank"]} == errors_on(changeset)
    end
  end

  describe ".expenses_on/1" do
    @expense %{
      "payee" => "Starbucks",
      "amount" => 5.75,
      "date" => "2020-08-11"
    }
    test "returns all expenses for the provided date" do
      assert {:ok, result_1} = Recording.record(@expense)
      assert {:ok, result_2} = Recording.record(@expense)
      assert {:ok, result_3} = Recording.record(Map.put(@expense, "date", "2020-08-10"))
      assert {:ok, [result_1, result_2]} == Recording.expenses_on("2020-08-11")
    end

    test "returns a blank list when there are no matching expenses" do
      assert {:ok, []} == Recording.expenses_on("2020-08-11")
    end
  end
end
