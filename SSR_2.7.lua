local PackageTable = {"packages/sm_wish", "packages/lvl_mad", "packages/narr_hvh", "packages/dlcs/vit/job_vit", "packages/job_mex"}

Hooks:PostHook(MissionManager, "init", "SSR_init", function(self)
	for _, v in pairs(PackageTable) do
		if PackageManager:package_exists(v) and not PackageManager:loaded(v) then
			PackageManager:load(v)
		end
	end
end)