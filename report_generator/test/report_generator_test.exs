defmodule ReportGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "generates the report" do
      filename = "report_test.csv"

      response = ReportGenerator.build(filename)

      expected_response = %{"all_hours" => %{"Cleiton" => 0, "Daniele" => 12, "Danilo" => 0, "Diego" => 0, "Giuliano" => 3, "Jakeliny" => 0, "Joseph" => 0, "Mayk" => 5, "Rafael" => 0, "Vinicius" => 0}, "hours_per_month" => %{"abril" => 7, "agosto" => 0, "dezembro" => 10, "fevereiro" => 3, "janeiro" => 0, "julho" => 0, "junho" => 0, "maio" => 0, "março" => 0, "novembro" => 0, "outubro" => 0, "setembro" => 0}, "hours_per_year" => %{2016 => 5, 2017 => 4, 2018 => 7, 2019 => 4, 2020 => 0}}

      assert response == expected_response
    end
  end
end
