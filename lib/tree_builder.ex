defmodule TreeBuilder do
  @moduledoc """
  Documentation for `TreeBuilder`.
  """

  def start(file) do
    File.read!(file)
    |> find_category()
  end

  def find_category(data) when is_bitstring(data) do
    data
    |> String.split("\n")
    |> Enum.map(&Regex.replace(~r/^http[[:alpha:]]?:\/\//, &1, ""))
    |> Enum.map(&String.split(&1, "\/", parts: 2, trim: true))
    |> List.delete_at(-1)
    |> Enum.group_by(&List.first/1, &List.last/1)
    |> Enum.map(&find_category/1)
  end

  def find_category({domain, urls}) do
    category = urls
    |> Enum.map(&String.split(&1, "\/", trim: true))
    |> Enum.map(&List.delete_at(&1, -1))
    |> Enum.map(&Enum.join(&1, "/"))
    |> Enum.filter(fn url -> String.length(url) > 0 end)
    |> Enum.dedup()
    Map.put(%{}, domain, category)
    |> IO.inspect()
  end
end
