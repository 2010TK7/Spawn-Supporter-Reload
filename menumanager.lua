Hooks:Add('LocalizationManagerPostInit', 'SS_LocalizationManagerPostInit', function(loc)
	SpawnSupporter:Load()
	if SpawnSupporter.settings.SS_loc then
		loc:load_localization_file(SpawnSupporter._path .. 'loc/zh_cn.json', false)
	else
		loc:load_localization_file(SpawnSupporter._path .. 'loc/en.json', false)
	end
end)

Hooks:Add('MenuManagerInitialize', 'SS_MenuManagerInitialize', function(menu_manager)
	MenuCallbackHandler.SSCheck = function(this, item)
		SpawnSupporter.settings[item:name()] = item:value() == 'on'
		SpawnSupporter:Save()
	end

	MenuCallbackHandler.SSSave = function(this, item)
		SpawnSupporter:Save()
	end

	SpawnSupporter:Load()
	MenuHelper:LoadFromJsonFile(SpawnSupporter._path .. 'menu.json', SpawnSupporter, SpawnSupporter.settings)
end)