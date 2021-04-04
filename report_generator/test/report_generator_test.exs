defmodule ReportGeneratorTest do
  use ExUnit.Case

  describe "build/1" do
    test "generates the report" do
      filename = "gen_report.csv"

      response = ReportGenerator.build(filename)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 13797,
          "Daniele" => 13264,
          "Danilo" => 13583,
          "Diego" => 13015,
          "Giuliano" => 13671,
          "Jakeliny" => 13909,
          "Joseph" => 13174,
          "Mayk" => 13526,
          "Rafael" => 13597,
          "Vinicius" => 13412
        },
        "hours_per_month" => %{
          "abril" => 11350,
          "agosto" => 11220,
          "dezembro" => 11099,
          "fevereiro" => 11194,
          "janeiro" => 11210,
          "julho" => 11320,
          "junho" => 11359,
          "maio" => 11141,
          "março" => 11283,
          "novembro" => 11298,
          "outubro" => 11030,
          "setembro" => 11444
        },
        "hours_per_year" => %{
          2016 => 26709,
          2017 => 26690,
          2018 => 27299,
          2019 => 26863,
          2020 => 27387
        }
      }

      assert response == expected_response
    end
  end

  describe "build_from_many/1" do
    test "generates the report" do
      filenames = ["part_1.csv", "part_2.csv", "part_3.csv"]

      response = ReportGenerator.build_from_many(filenames)

      expected_response = %{
        "all_hours" => %{
          "Cleiton" => 4704,
          "Daniele" => 4554,
          "Danilo" => 4278,
          "Diego" => 4332,
          "Giuliano" => 4812,
          "Jakeliny" => 4672,
          "Joseph" => 4435,
          "Mayk" => 4634,
          "Rafael" => 4554,
          "Vinicius" => 4196
        },
        "hours_per_month" => %{
          "abril" => 3753,
          "agosto" => 3740,
          "dezembro" => 3878,
          "fevereiro" => 3805,
          "janeiro" => 3621,
          "julho" => 3592,
          "junho" => 3848,
          "maio" => 3554,
          "março" => 3681,
          "novembro" => 4078,
          "outubro" => 3777,
          "setembro" => 3844
        },
        "hours_per_year" => %{
          2016 => 8725,
          2017 => 8998,
          2018 => 9188,
          2019 => 8913,
          2020 => 9347
        }
      }

      assert response == expected_response
    end
  end
end
