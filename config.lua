local Types = require(game.ServerStorage.Util.Types)
local Set = require(game.ServerStorage.Util.Set)

local TileRuleManager = require(game.ServerStorage.TileRuleManager)
local Settings = require(game.ServerStorage.Services.SettingsService):GetSettings(true)
local BoardController = require(game.ServerStorage.Controllers.BoardController)

return {
	"0.4",
	{
		name = "knight",
		enabled = true,
		icon = "rbxassetid://6176342298",
		max = -1,
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "movement",
		pattern = Vector2.new(1, 2),
		reflect = true,
		rotate = true,
		value = 2,
	},
	{
		name = "bishop",
		enabled = true,
		icon = "rbxassetid://6176342379",
		max = -1,
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "movement",
		diagonalLimit = -1,
		value = 2,
	},
	{
		name = "queen",
		enabled = true,
		icon = "rbxassetid://6176342217",
		max = -1,
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "movement",
		diagonalLimit = -1,
		rankLimit = -1,
		fileLimit = -1,
		value = 3,
	},
	{
		name = "rook",
		enabled = true,
		icon = "rbxassetid://6176342135",
		max = -1,
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "movement",
		rankLimit = -1,
		fileLimit = -1,
		value = 2,
	},
	{
		name = "king",
		enabled = false,
		icon = "rbxassetid://",
		max = -1,
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "movement",
		rankLimit = 1,
		fileLimit = 1,
		diagonalLimit = 1,
		value = 1,
	},
	{
		name = "swap",
		enabled = false,
		icon = "rbxassetid://6176342066",
		max = 6,
		tags = Set({"no-swap", "no-spawn", "ally"}),
		entityType = "Tile",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return TileRuleManager.getValidForTile(selfTile)
		end,
		set = "core",
		subset = "environment",
		rankLimit = 1,
		fileLimit = 1,
		diagonalLimit = 1
		value = 1,
	},
	{
		name = "teleport",
		enabled = false,
		icon = "rbxassetid://6176341988",
		max = Settings.playerCount - 1,
		tags = Set({"no-swap", "no-teleport", "no-spawn"}),
		entityType = "Pawn",
		getValidMoves = function(selfTile: Types.Tile): {Types.Tile}
			return {}
		end,
		set = "core",
		subset = "movement",
		value = 3,
	},
	{
		name = "trap",
		enabled = false,
		icon = "rbxassetid://11151568746",
		max = 2,
		tags = Set({"no-teleport", "no-spawn"}),
		entityType = "Pawn",
		gamepassId = 91110481,
		set = "dlc",
		subset = "movement",
		movedTo = function(selfTile: Types.Tile)
			--BoardController:CapturePawn(selfTile.pawn.pawn)
		end,
		value = 0,
	},
	{
		name = "spooky",
		enabled = false,
		set = "dlc",
		subset = "seasonal",
		icon = "rbxassetid://",
		tags = Set({"no-spawn", "no-teleport"}),
		max = 2,
		gamepassId = 0,
		movedTo = function(selfTile: Types.Tile)
			local rnd = Random.new()
			if rnd.NextNumber() > 0.5 then
				print("Trick")
				-- BoardController:CapturePawn(selfTile.pawn.pawn)
			else
				print("Treat")
				-- TODO: Pick random tile
				-- BoardController:ModifyState(selfTile, newTile)
			end
		end,
		value = 0,
	}
}
