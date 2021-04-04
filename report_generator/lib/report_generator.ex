defmodule ReportGenerator do
  alias ReportGenerator.Parser

  @years [
    2016,
    2017,
    2018,
    2019,
    2020
  ]

  @months %{
    1 => "janeiro",
    2 => "fevereiro",
    3 => "março",
    4 => "abril",
    5 => "maio",
    6 => "junho",
    7 => "julho",
    8 => "agosto",
    9 => "setembro",
    10 => "outubro",
    11 => "novembro",
    12 => "dezembro"
  }

  @people [
    "Daniele",
    "Mayk",
    "Giuliano",
    "Cleiton",
    "Jakeliny",
    "Joseph",
    "Diego",
    "Danilo",
    "Rafael",
    "Vinicius"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(generate_empty_report(), fn line, report -> add_line(line, report) end)
  end

  defp add_line(
         [name, hours_qty, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         }
       ) do

    all_hours = Map.put(all_hours, name, all_hours[name] + hours_qty)
    hours_per_month = Map.put(hours_per_month, @months[month], hours_per_month[@months[month]] + hours_qty)
    hours_per_year = Map.put(hours_per_year, year, hours_per_year[year] + hours_qty)
    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp generate_empty_report do
    all_hours = generate_all_hours_report()
    hours_per_month = generate_months_report()
    hours_per_year = generate_years_report()

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp generate_months_report() do
    Enum.into(@months, %{}, fn {_k, v} -> {v, 0} end)
  end

  defp generate_years_report() do
    Enum.into(@years, %{}, &{&1, 0})
  end

  defp generate_all_hours_report() do
    Enum.into(@people, %{}, &{&1, 0})
  end

  defp build_report(all_hours, hours_per_month, hours_per_year) do
    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
