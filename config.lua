local Types = require(game.ServerStorage.Util.Types)

return {
	version = "0.1",
	{
		name = "diagonal",
		enabled = true,
		icon = "rbxassetid://6176342379",
		max = -1,
		tags = {},
		highlight = function(BoardData: Types.BoardState, SelectedPawn: BasePart?): {Types.OldTile}
			print("Hello world diagonal.")
			return {}
		end,
		set = "core",
		subset = "movement"
	},
	{
		name = "trap",
		enabled = false,
		icon = "rbxassetid://11151568746",
		max = 2,
		tags = {"no-teleport", "no-spawn"},
		highlight = function(BoardData: Types.BoardState, SelectedPawn: BasePart?): {Types.OldTile}
			print("Hello world trap.")
			return {}
		end,
		set = "dlc",
		subset = "movement",
		gamepassId = 91110481
	}
}
