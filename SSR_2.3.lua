Hooks:PostHook(LevelsTweakData, "init", "SSR_init", function(self)
	for k, v in pairs(self) do
		if v.package then
			if type(v.package) == "string" then
				self[k].package = {v.package}
			end
			if #self[k].package == 1 then
				if Global.game_settings and Global.game_settings.difficulty ~= "sm_wish" then
					table.insert(self[k].package, "packages/sm_wish")
				end
				if k ~= "mad" then
					table.insert(self[k].package, "packages/lvl_mad")
				end
				if k ~= "hvh" then
					table.insert(self[k].package, "packages/narr_hvh")
				end
				if k ~= "bph" then
					table.insert(self[k].package, "packages/dlcs/bph/job_bph")
				end
			end
		end
	end
end)