Hooks:PostHook(MissionManager, "init", "SSR_init", function(self)
	if Global.game_settings and Global.game_settings.difficulty ~= "sm_wish" then
		PackageManager:load("packages/sm_wish")
	end
	if tweak_data.levels.ai_groups and tweak_data.levels:get_ai_group_type() ~= "russia" then
		PackageManager:load("packages/lvl_mad")
	end
	if tweak_data.levels.ai_groups and tweak_data.levels:get_ai_group_type() ~= "zombie" then
		PackageManager:load("packages/narr_hvh")
	end
	if tweak_data.levels.ai_groups and tweak_data.levels:get_ai_group_type() ~= "murkywater" then
		PackageManager:load("packages/dlcs/bph/job_bph")
	end
end)