defmodule TreeBuilderTest do
  use ExUnit.Case

  test "build tree" do
    tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick,vk.com/users/friends,vk.com/users,vk.com/albums,vk.com/albums/private"

    assert TreeBuilder.find_category(tree) == [%{"vk.com" => ["users/friends", "users", "albums"]}]
  end

  test "build tree" do
    tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick,vk.com/users/friends,vk.com/users,vk.com/albums,vk.com/albums/private"

    assert TreeBuilder.find_category(tree) == [%{"vk.com" => ["users/friends", "users", "albums"]}]
  end
end
