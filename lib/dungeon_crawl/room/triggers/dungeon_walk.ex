defmodule DungeonCrawl.Room.Triggers.Dungeon_Walk do
  @behaviour DungeonCrawl.Room.Trigger
  def run(character, _), do: {character, :forward}
end
