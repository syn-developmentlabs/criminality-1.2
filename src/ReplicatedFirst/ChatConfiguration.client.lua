local Chat = game:GetService("Chat")

Chat:RegisterChatCallback(Enum.ChatCallbackType.OnCreatingChatWindow, function()
	return {
		ClassicChatEnabled = false, 
		BubbleChatEnabled = true
	}
end)

local ChatSettings = {
	BubbleDuration = 10, 
	MaxBubbles = 3, 
	BackgroundColor3 = Color3.fromRGB(248, 248, 248), 
	TextColor3 = Color3.fromRGB(0, 0, 0), 
	TextSize = 18, 
	Font = Enum.Font.GothamSemibold, 
	Transparency = 0, 
	CornerRadius = UDim.new(0, 3), 
	TailVisible = true, 
	Padding = 8, 
	MaxWidth = 300, 
	VerticalStudsOffset = 0, 
	BubblesSpacing = 6, 
	MinimizeDistance = 35, 
	MaxDistance = 75
}

pcall(function()
	Chat:SetBubbleChatSettings(ChatSettings)
end)