local readmeText = [[
	# moveOutside
	moveOutside is a Roblox plugin that moves specific models outside the workspace.
	
	## Usage

	The plugin automatically creates a folder called `moveOutside` when opening a place. Move objects that should be moved outside of Workspace into it.
]]

function preparePlugin()
	
	local outsideFolder = Instance.new("Folder")
	outsideFolder.Name = "moveOutside"
	outsideFolder.Parent = game.Workspace
	
	local readme = Instance.new("Script")
	readme.Name = "README"
	readme.Disabled = true
	readme.Source = "--[[" .. readmeText .. "--]]"
	readme.Parent = outsideFolder
	
	outsideFolder.ChildAdded:Connect(function(child)
		if(child.Name ~= "README") then
			wait()
			child.Parent = game
		end
	end)
	
end

if(not game.Workspace:FindFirstChild("moveOutside")) then
	
	preparePlugin()
	
else
	
	game.Workspace:FindFirstChild("moveOutside"):Remove()
	preparePlugin()
	
end