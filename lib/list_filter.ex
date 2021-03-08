defmodule ListFilter do
  def call(list), do: filter_odd(list)

  defp filter_odd(list) do
    convert_to_integer(list)
    |> Enum.filter(fn value -> rem(value, 2) != 0 end)
    |> length()
  end

  defp convert_to_integer(list) do
    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        {int, _string} -> [int]
        :error -> []
      end
    end)
  end
end
