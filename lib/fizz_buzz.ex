defmodule FizzBuzz do
  alias FizzBuzz.Engine
  defdelegate run(file_name), to: Engine
end
