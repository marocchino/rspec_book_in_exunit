defmodule ExpenseTrackerWeb.Router do
  use ExpenseTrackerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ExpenseTrackerWeb do
    pipe_through(:api)
    post("/expenses", ExpensesController, :create)
    get("/expenses/:date", ExpensesController, :index)
  end
end
