defmodule TreeBuilderTest do
  use ExUnit.Case

  # doctest TreeBuilder

  alias TreeBuilder.Node

  # test "build tree" do
  #   tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick"

  #   assert TreeBuilder.tree(tree) == [
  #            %Node{
  #              name: "vk.com",
  #              children: [
  #                %Node{
  #                  name: "users",
  #                  children: [
  #                    %Node{
  #                      name: "friends",
  #                      children: [
  #                        %Node{name: "kryglokot", children: []},
  #                        %Node{name: "radzivonchick", children: []}
  #                      ]
  #                    }
  #                  ]
  #                }
  #              ]
  #            }
  #          ]
  # end

  test "build tree" do
    tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick,vk.com/users/friends,vk.com/users,vk.com/albums,vk.com/albums/private"

    # %{"vk.com" => [["users", "friends", "kryglokot"], ["users", "friends", "radzivonchick"], ["users"]]}
    assert TreeBuilder.find_category(tree) == [%{"vk.com" => ["users/friends", "users", "albums"]}]
  end

  test "build tree" do
    tree = "vk.com/users/friends/kryglokot,vk.com/users/friends/radzivonchick,vk.com/users/friends,vk.com/users,vk.com/albums,vk.com/albums/private"

    # %{"vk.com" => [["users", "friends", "kryglokot"], ["users", "friends", "radzivonchick"], ["users"]]}
    assert TreeBuilder.find_category(tree) == [%{"vk.com" => ["users/friends", "users", "albums"]}]
  end

  # test "parse url" do
  #   url_list = ["vk.com"]
  #   assert TreeBuilder.parse_url(url_list) == [{1, "vk.com", nil}]
  # end

  # test "build node" do
  #   ["vk.com", "users", "friends", "kruglokot"]
  #   assert false
  # end
end
