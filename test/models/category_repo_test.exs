defmodule Rumbl.CategoryRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.Category

  test "alphabetical/1 orders by name" do
    Repo.insert!(%Category{name: "cat"})
    Repo.insert!(%Category{name: "aardvark"})
    Repo.insert!(%Category{name: "bat"})

    query = Category |> Category.alphabetical()
    query = from c in query, select: c.name
    assert Repo.all(query) == ~w(aardvark bat cat)
  end
end
