defmodule FizzBuzz.Engine do
  def run(file_name) do
    file_name
    |> read_data()
  end

  def read_data(file_name) do
    "../../assets/#{file_name}"
    |> Path.expand(__DIR__)
    |> File.read()
    |> handleFile()
  end

  defp handleFile({:ok, result}) do
    fizz_buzz_result =
      result
      |> String.trim_trailing()
      |> String.split(~r/,/)
      |> Enum.map(&String.to_integer/1)
      |> Enum.map(&evaluate_number/1)

    {:ok, fizz_buzz_result}
  end

  defp handleFile({:error, reason}), do: {:error, "Error reading file #{reason}"}
  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
