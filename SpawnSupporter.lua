local key = ModPath .. '	' .. RequiredScript
if _G[key] then return else _G[key] = true end

_G.SpawnSupporter = _G.SpawnSupporter or {}
SpawnSupporter._path = ModPath
SpawnSupporter._data_path = SavePath .. 'Tmod/TSS.txt'
SpawnSupporter.settings = SpawnSupporter.settings or {
	SS_loc = false,
	SS_zeal = true,
	SS_russia = true,
	SS_zombie = true,
	SS_murkywater = true,
	SS_bolivian = true
}

function SpawnSupporter:Save()
	local file = io.open(self._data_path, 'w+')
	if file then
		file:write(json.encode(self.settings))
		file:close()
	end
end

function SpawnSupporter:Load()
	local file = io.open(self._data_path, 'r')
	if file then
		for k, v in pairs(json.decode(file:read('*all')) or {}) do
			self.settings[k] = v
		end
		file:close()
	end
end

function SpawnSupporter:Reload()
	SpawnSupporter:Load()
	if SpawnSupporter.settings.SS_zeal and not PackageManager:loaded("packages/sm_wish") then
		PackageManager:load("packages/sm_wish")
	end
	if SpawnSupporter.settings.SS_russia and not PackageManager:loaded("packages/lvl_mad") then
		PackageManager:load("packages/lvl_mad")
	end
	if SpawnSupporter.settings.SS_zombie and not PackageManager:loaded("packages/narr_hvh") then
		PackageManager:load("packages/narr_hvh")
	end
	if SpawnSupporter.settings.SS_murkywater and not PackageManager:loaded("packages/dlcs/vit/job_vit") then
		PackageManager:load("packages/dlcs/vit/job_vit")
	end
	if SpawnSupporter.settings.SS_bolivian and not PackageManager:loaded("packages/lvl_friend") then
		PackageManager:load("packages/lvl_friend")
	end
end