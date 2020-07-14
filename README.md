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

## Chapter 2

### Customizing Your Specs' Output

#### The Progress Formatter

```elixir
defmodule RspecBook.CoffeeTest do
  use ExUnit.Case
  doctest RspecBook.Coffee
  alias RspecBook.Coffee

  setup do
    {:ok, coffee: %Coffee{}}
  end

  test "it costs $1", %{coffee: coffee} do
    assert Coffee.price(coffee) == 1.00
  end
  describe "with milk" do
    setup %{coffee: coffee} do
      {:ok, coffee: Coffee.add(coffee, :milk)}
    end

    test "it costs $1.25", %{coffee: coffee} do
      assert Coffee.price(coffee) == 1.25
    end
  end
end
```

```elixir
defmodule RspecBook.Coffee do
  defstruct ingredients: []

  def add(coffee, ingredient)
    Map.put(coffee, :ingredients, [ingredient | coffee.ingredients])
  end
end
```

### The Documentation Formatter

```
mix test --trace
```

or make your [own formatter](https://github.com/elixir-lang/elixir/blob/master/lib/ex_unit/lib/ex_unit/cli_formatter.ex) and use it.

```
mix test --formatter=XXX.YYY
```

### Syntax highlighting

### Identifying Slow Examples

```elixir
defmodule RspecBook.SlowTest do
  use ExUnit.Case


  test "it can sleep for 0.1 second", do: Process.sleep(100)
  test "it can sleep for 0.2 second", do: Process.sleep(200)
  test "it can sleep for 0.3 second", do: Process.sleep(300)
  test "it can sleep for 0.4 second", do: Process.sleep(400)
  test "it can sleep for 0.5 second", do: Process.sleep(500)
end
```

```sh
mix test --slowest 2
```

### Running Just What You Need

```sh
mix test test/unit
mix test test/unit/specific_test.exs
mix test test/unit test/smoke
mix test test/unit test/foo_test.exs
```

#### Running Examples by Name

#### Running Specific Failures

```sh
mix test
mix test test/rspec_book/sandwich_test.exs:17
```

#### Running Everything That Failed

```sh
mix test
mix test --failed
```

> :failures_manifest_file - specifies a path to the file used to store failures between runs;


```elixir
defmodule RspecBook.Coffee do
  defstruct ingredients: []

  def add(coffee, ingredient)
    Map.put(coffee, :ingredients, [ingredient | coffee.ingredients])
  end

  def price(coffee)
    1.00 + length(coffee.ingredients) * 0.25
  end
end
```

#### Focusing Specific Examples

```elixir
@tag :wip
```

> :include - specifies which tests are run by skipping tests that do not match the filter. Keep in mind that all tests are included by default, so unless they are excluded first, the :include option has no effect. To only run the tests that match the :include filter, exclude the :test tag first (see the documentation for ExUnit.Case for more information on tags);

#### Tag Filtering

```
mix test --include wip
```

### Marking Work in Progress

#### Starting With the Description

```elixir
test 'it is light in color'
test 'it cooler than 200 degrees Fahrenheit'
```

#### Marking Incomplete Work

```elixir
@tag :skip
test 'it is light in color', %{coffee: coffee} do
  assert Coffee.color(coffee) == :light
end

@tag :skip
test 'it cooler than 200 degrees Fahrenheit', %{coffee: coffee} do
  assert Coffee.temperature(coffee) < 200.0
end
```

#### Completing Work In Progress

```elixir
def color(coffee) do
  case :milk in coffee.ingredients do
    true -> :light
    false -> :dark
  end
end

def temperature(coffee) do
  case :milk in coffee.ingredients do
    true -> 190.0
    false -> 205.0
  end
end
```

### Your Turn

```elixir
defmodule RspecBook.TeaTest do
  use ExUnit.Case
  doctest RspecBook.Tea
  alias RspecBook.Tea

  setup do
    {:ok, tea: %Tea{}}
  end

  test "it tastes like Earl Grey", %{tea: tea} do
    assert Tea.flavor(tea) == :earl_grey
  end

  test "it is hot", %{tea: tea} do
    assert Tea.temperature(tea) > 200.0
  end
end
```
