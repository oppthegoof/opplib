local function dragify(Frame)
	local dragToggle, dragInput, dragStart, startPos

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
	end

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragToggle = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local Root = {}

function Root.Window(Title)
	local Window = {}
	-- StarterGui.opplib
	Window["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
	Window["1"]["Name"] = [[opplib]];
	

	-- StarterGui.opplib.Menu
	Window["2"] = Instance.new("Frame", Window["1"]);
	Window["2"]["BorderSizePixel"] = 0;
	Window["2"]["BackgroundColor3"] = Color3.fromRGB(120, 0, 255);
	Window["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Window["2"]["Size"] = UDim2.new(0, 198, 0, 308);
	Window["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	Window["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Window["2"]["Name"] = [[Menu]];
	
	dragify(Window["2"])


	-- StarterGui.opplib.Menu.Title
	Window["3"] = Instance.new("TextLabel", Window["2"]);
	Window["3"]["BorderSizePixel"] = 0;
	Window["3"]["TextSize"] = 20;
	Window["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Window["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	Window["3"]["TextColor3"] = Color3.fromRGB(243, 255, 0);
	Window["3"]["BackgroundTransparency"] = 1;
	Window["3"]["Size"] = UDim2.new(1, 0, 0, 25);
	Window["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Window["3"]["Text"] = [[OPP LIB]];
	Window["3"]["Name"] = [[Title]];


	-- StarterGui.opplib.Menu.Title.UIStroke
	Window["4"] = Instance.new("UIStroke", Window["3"]);



	-- StarterGui.opplib.Menu.Title.UIStroke
	Window["5"] = Instance.new("UIStroke", Window["3"]);
	Window["5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	Window["5"]["Thickness"] = 2;


	-- StarterGui.opplib.Menu.UIStroke
	Window["6"] = Instance.new("UIStroke", Window["2"]);
	Window["6"]["Thickness"] = 2;
	Window["6"]["Color"] = Color3.fromRGB(120, 0, 255);


	-- StarterGui.opplib.Menu.UIStroke.UIGradient
	Window["7"] = Instance.new("UIGradient", Window["6"]);
	Window["7"]["Rotation"] = 90;
	Window["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(116, 0, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


	-- StarterGui.opplib.Menu.UIGradient
	Window["8"] = Instance.new("UIGradient", Window["2"]);
	Window["8"]["Rotation"] = -90;
	Window["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(116, 0, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};


	-- StarterGui.opplib.Menu.ScrollingFrame
	Window["9"] = Instance.new("ScrollingFrame", Window["2"]);
	Window["9"]["Active"] = true;
	Window["9"]["BorderSizePixel"] = 0;
	Window["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	Window["9"]["ScrollBarImageTransparency"] = 1;
	Window["9"]["Size"] = UDim2.new(1, 0, 1, -25);
	Window["9"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	Window["9"]["Position"] = UDim2.new(0, 0, 0.08117, 0);
	Window["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Window["9"]["ScrollBarThickness"] = 0;
	Window["9"]["BackgroundTransparency"] = 0.9;
	
	-- StarterGui.opplib.Menu.ScrollingFrame.UIListLayout
	Window["e"] = Instance.new("UIListLayout", Window["9"]);
	Window["e"]["Padding"] = UDim.new(0, 5);
	Window["e"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	
	function Window.Btn(Text, CallBack)
		local Btn = {}
		-- StarterGui.opplib.Menu.ScrollingFrame.TextButton
		Btn["a"] = Instance.new("TextButton", Window["9"]);
		Btn["a"]["BorderSizePixel"] = 0;
		Btn["a"]["TextColor3"] = Color3.fromRGB(243, 255, 0);
		Btn["a"]["TextSize"] = 20;
		Btn["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Btn["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Btn["a"]["Size"] = UDim2.new(1, 0, 0, 25);
		Btn["a"]["BackgroundTransparency"] = 1;
		Btn["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


		-- StarterGui.opplib.Menu.ScrollingFrame.TextButton.UIStroke
		Btn["b"] = Instance.new("UIStroke", Btn["a"]);
		
		Btn["a"].MouseButton1Up:Connect(CallBack)
	end
	
	function Window.Label(Text)
		local Label = {}
		-- StarterGui.opplib.Menu.ScrollingFrame.Label
		Label["c"] = Instance.new("TextLabel", Window["9"]);
		Label["c"]["BorderSizePixel"] = 0;
		Label["c"]["TextSize"] = 20;
		Label["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Label["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Label["c"]["TextColor3"] = Color3.fromRGB(172, 181, 0);
		Label["c"]["BackgroundTransparency"] = 1;
		Label["c"]["Size"] = UDim2.new(1, 0, 0, 25);
		Label["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Label["c"]["Name"] = [[Label]];
		Label["c"]["Position"] = UDim2.new(-0, 0, 0, 0);


		-- StarterGui.opplib.Menu.ScrollingFrame.Label.UIStroke
		Label["d"] = Instance.new("UIStroke", Label["c"]);
	end
	
	function Window.Spacer()
		local Spacer = {}
		-- StarterGui.opplib.Menu.ScrollingFrame.Spacer
		Spacer["f"] = Instance.new("Frame", Window["9"]);
		Spacer["f"]["BorderSizePixel"] = 0;
		Spacer["f"]["BackgroundColor3"] = Color3.fromRGB(252, 255, 0);
		Spacer["f"]["Size"] = UDim2.new(1, 0, 0, 5);
		Spacer["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Spacer["f"]["Name"] = [[Spacer]];


		-- StarterGui.opplib.Menu.ScrollingFrame.Spacer.UIStroke
		Spacer["10"] = Instance.new("UIStroke", Spacer["f"]);
	end
	
	return Window
end

return Root, require;
