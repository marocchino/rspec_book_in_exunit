defmodule ExpenseTracker.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :payee, :string
      add :amount, :float
      add :date, :date
    end
  end
end
