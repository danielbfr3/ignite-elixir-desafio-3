defmodule ReportGenerator.ParserTest do
  use ExUnit.Case

  alias ReportGenerator.Parser

  describe "parse_file/1" do
    test "parses the file" do
      filename = "report_test.csv"

      response =
        filename
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_response = [
        ["Daniele", 7, 29, 4, 2018],
        ["Mayk", 4, 9, 12, 2019],
        ["Daniele", 5, 27, 12, 2016],
        ["Mayk", 1, 2, 12, 2017],
        ["Giuliano", 3, 13, 2, 2017]
      ]

      assert response == expected_response
    end
  end
end
