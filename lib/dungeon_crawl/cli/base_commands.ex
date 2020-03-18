defmodule DungeonCrawl.CLI.BaseCommands do
  alias Mix.Shell.IO, as: Shell
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
        Shell.info("#{index} - #{option}")
      end)
    options
  end

  def generate_question(options) do
    options = Enum.join(1..Enum.count(options),",")
    "Which one? [#{options}]\n"
  end

  #### using Case instead of with
  # def parse_answer!(answer) do
  #   case Integer.parse(answer) do
  #     :error -> raise DungeonCrawl.CLI.InvalidOptionError
  #     {option, _} -> option - 1
  #   end
  # end
  # def find_option_by_index!(index, options) do
  #   Enum.at(options, index) || raise DungeonCrawl.CLI.InvalidOptionError
  # end
  def ask_for_index(options) do
    answer = options
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> Integer.parse

    case answer do
      :error -> display_invalid_option()
      ask_for_index(options)
      {option, _} -> option - 1
    end
  end
  def display_invalid_option do
    Shell.cmd("clear")
    Shell.error("Invalid option.")
    Shell.prompt("Press Enter to try again.")
    Shell.cmd("clear")
  end

  def ask_for_option(options) do
    # try do
      answer = options
      |> display_options
      |> generate_question
      |> Shell.prompt
      # |> parse_answer!
      # |> find_option_by_index!(options)
    # rescue
    #   e in DungeonCrawl.CLI.InvalidOptionError ->
    #     display_error(e)
    #     ask_for_option(options)
    #end

    with  {option, _} <- Integer.parse(answer),
          chosen when chosen != nil <- Enum.at(options, option - 1) do
      chosen
    else
      :error -> retry(options)
      nil -> retry(options)
    end
  end

  def retry(options) do
    display_error("Invalid option")
    ask_for_option(options)
  end

  def display_error(message) do
    Shell.cmd("clear")
    Shell.error(message)
    Shell.prompt("Press Enter to continue.")
    Shell.cmd("clear")
  end


end
