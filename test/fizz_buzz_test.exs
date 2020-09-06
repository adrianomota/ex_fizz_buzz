defmodule FizzBuzzTest do
  use ExUnit.Case

  describe "run/1" do
    test "when a valid file is provided, returns the converted list" do
      expected_response =
        {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, 11, :fizz, 13, 14, :fizzbuzz]}

      assert FizzBuzz.run("numbers.txt") == expected_response
    end

    test "when a invalid file is provided, returns an error" do
      expected_response = {:error, "Error reading file enoent"}

      assert FizzBuzz.run("invalid_file.txt") == expected_response
    end
  end
end
