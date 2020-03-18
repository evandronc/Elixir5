defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil

  def all, do:
  [ %Room{
      description: "You're tired and you can rest in this unknown room, on this unknown bed. Or keep moving forward.",
      actions: [forward(), rest()],
      trigger: Triggers.Rest
    },
    %Room{
      description: "There's nothing in here, we should keep walking",
      actions: [forward()],
      trigger: Triggers.Dungeon_Walk
    },
    %Room{
      description: "You can see the light of day ahead, is it the exit?",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
  ]
end
