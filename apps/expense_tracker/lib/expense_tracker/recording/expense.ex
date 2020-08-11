defmodule ExpenseTracker.Recording.Expense do
  use Ecto.Schema
  alias Ecto.Changeset

  @type t :: %__MODULE__{}

  @derive {Jason.Encoder, only: [:id, :payee, :amount, :date]}
  schema "expenses" do
    field(:payee)
    field(:amount, :float)
    field(:date, :date)
  end

  @spec changeset(map) :: Changeset.t()
  def changeset(params) do
    Changeset.cast(%__MODULE__{}, params, [:payee, :amount, :date])
    |> Changeset.validate_required([:payee, :amount, :date])
  end
end
