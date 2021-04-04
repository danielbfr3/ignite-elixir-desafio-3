defmodule ReportGenerator.Parser do
  def parse_file(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(1, fn x -> String.to_integer(x) end)
    |> List.update_at(2, fn x -> String.to_integer(x) end)
    |> List.update_at(3, fn x -> String.to_integer(x) end)
    |> List.update_at(4, fn x -> String.to_integer(x) end)
  end
end
