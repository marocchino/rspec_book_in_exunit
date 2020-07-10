# RspecBook

## Chapter 1

### Install ExUnit

```sh
mix new rspec_book
cd rspec_book
```

### Your First Spec


```elixir
# 01-getting-started/01/spec/sandwich_spec.rb
defmodule RspecBook.SandwichTest do
  use ExUnit.Case
  doctest RspecBook.Sandwith
  alias RspecBook.Sandwich

  describe "an ideal sandwich" do
    test "is delicious" do
    end
  end
end

# 01-getting-started/02/spec/sandwich_spec.rb
defmodule RspecBook.SandwichTest do
  use ExUnit.Case
  doctest RspecBook.Sandwith
  alias RspecBook.Sandwich

  describe "an ideal sandwich" do
    test "is delicious" do
      sandwich = %Sandwich{taste: "delicious"}
      assert sandwich.taste == "delicious"
    end
  end
end
```

### Groups, Examples, and Expectations

- groups -> describe
- examble -> test
- expectation -> assert

### Getting the Most Out of RSpec

- sandwichのあるまじき姿の文書化
- sandwichの行動の確認

```elixir
# 01-getting-started/02/sandwich_test.rb
assert sandwich.taste == "delicious", "Sandwith is not delicious."
```

### Understanding Failure

```elixir
# 01-getting-started/03/spec/sandwich_spec.rb
defmodule RspecBook.Sandwich do
  defstruct taste: nil, toppings: []
end
```

### Sharing Setup (But Not Sandwiches)

```elixir
# 01-getting-started/04/spec/sandwich_spec.rb
test "lets me add toppings", %{sandwich: sandwich} do
  sandwich = %Sandwich{taste: "delicious"}
  sandwich = Map.put(sandwich, :toppings, ["cheese" | sandwich.toppings])
  refute Enum.empty?(sandwich.toppings)
end
```

### Hooks
```elixir
# 01-getting-started/05/spec/sandwich_spec.rb
describe "an ideal sandwich" do
  setup do
    {:ok, sandwich: build(:sandwich) }
  end

# 01-getting-started/05/spec/sandwich_spec.rb
test "is delicious", %{sandwich: sandwich} do
  assert sandwich.taste == "delicious"
end

test "lets me add toppings", %{sandwich: sandwich} do
  sandwich = Map.put(sandwich, :toppings, ["cheese" | sandwich.toppings])
  refute Enum.empty?(sandwich.toppings)
end
```

letはexunitには無いのでこの以後は無視

### Your turn

#### Exercises

1. setupしか無いので比較しようがない
1. <https://hexdocs.pm/mix/Mix.Tasks.Test.html>で読める

