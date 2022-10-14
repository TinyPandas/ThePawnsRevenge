local Types = require(game.ServerStorage.Util.Types)

return {
	{
		name = "diagonal",
		icon = "rbxassetid://6176342379",
		max = -1,
		tags = {},
		highlight = function(SelectedPawn: BasePart, BoardData: Types.BoardState): {Types.Tile}
			print("Hello world diagonal.")
			return {}
		end,
		set = "core",
		subset = "movement"
	},
	{
		name = "trap",
		icon = "rbxassetid://11151568746",
		max = 2,
		tags = {"no-teleport", "no-spawn"},
		highlight = function(SelectedPawn: BasePart, BoardData: Types.BoardState): {Types.Tile}
			print("Hello world trap.")
			return {}
		end,
		set = "dlc",
		subset = "movement",
		gamepassId = 91110481
	}
}
