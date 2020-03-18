defmodule DungeonCrawl.Room.Triggers.Rest do
  @behaviour DungeonCrawl.Room.Trigger
  def run(character, _), do: {character, :rest}
end
