defmodule TreeBuilder do
  @moduledoc """
  Documentation for `TreeBuilder`.
  """

  def tree(data) when is_bitstring(data) do
    String.split(data, ",")
    |> Enum.map(&String.split(&1, "/"))
  end

  def parse_url(url) when is_list(url) do
    nil
  end
end
