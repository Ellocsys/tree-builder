defmodule TreeBuilderTest do
  use ExUnit.Case
  # doctest TreeBuilder

  test "build tree" do
    tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick"
    assert TreeBuilder.tree(tree) == [{1, "vk.com", nil}, {2, "users", 1}, {3, "friends", 2}, {4, "kryglokot", 3}, {5, "radzivonchick", 3}]
  end
end