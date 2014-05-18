-- http://i.imgur.com/RkLJFVh.jpg
if love then
	if love.filesystem then
		love.filesystem.directoryEh			= love.filesystem.isDirectory
		love.filesystem.fileEh				= love.filesystem.isFile
		love.filesystem.fusedEh				= love.filesystem.isFused
	end

	if love.graphics then
		love.graphics.supportedEh			= love.graphics.isSupported
		love.graphics.wireframeEh			= love.graphics.isWireframe

		love.graphics.getBackgroundColour	= love.graphics.getBackgroundColor
		love.graphics.getColour				= love.graphics.getColor
		love.graphics.getColourMask			= love.graphics.getColorMask
		love.graphics.getColourMode			= love.graphics.getColorMode
		love.graphics.setBackgroundColour	= love.graphics.setBackgroundColor
		love.graphics.setColour				= love.graphics.setColor
		love.graphics.setColourMask			= love.graphics.setColorMask
		love.graphics.setColourMode			= love.graphics.setColorMode
	end

	if love.image then
		love.image.compressedEh				= love.image.isCompressed
	end

	if love.keyboard then
		love.keyboard.downEh				= love.keyboard.isDown
		love.keyboard.keyRepeatEh			= love.keyboard.hasKeyRepeat
		love.keyboard.textInputEh			= love.keyboard.hasTextInput
	end

	if love.math then
		love.math.convexEh					= love.math.isConvex
	end

	if love.mouse then
		love.mouse.downEh					= love.mouse.isDown
		love.mouse.grabbedEh				= love.mouse.isGrabbed
		love.mouse.visibleEh				= love.mouse.isVisible
	end

	if love.window then
		love.window.createdEh				= love.window.isCreated
		love.window.visibleEh				= love.window.isVisible
		love.window.focusEh					= love.window.hasFocus
		love.window.mouseFocusEh			= love.window.hasMouseFocus
	end

	local function error_printer(msg, layer)
		print("Oh b'y we right done 'er this time, eh?")
		print("Sorry 'boot that, let's 'ave a look under the hood shall we?")
	    print((debug.traceback("Error: " .. tostring(msg), 1+(layer or 1)):gsub("\n[^\n]+$", "")))
	end

	function love.errhand(msg)
	    msg = tostring(msg)

	    error_printer(msg, 2)

	    if not love.window or not love.graphics or not love.event then
	        return
	    end

	    if not love.graphics.isCreated() or not love.window.isCreated() then
	        if not pcall(love.window.setMode, 800, 600) then
	            return
	        end
	    end

	    -- Reset state.
	    if love.mouse then
	        love.mouse.setVisible(true)
	        love.mouse.setGrabbed(false)
	    end
	    if love.joystick then
	        for i,v in ipairs(love.joystick.getJoysticks()) do
	            v:setVibration() -- Stop all joystick vibrations.
	        end
	    end
	    if love.audio then love.audio.stop() end
	    love.graphics.reset()
	    love.graphics.setBackgroundColor(89, 157, 220)
	    local font = love.graphics.setNewFont(14)

	    love.graphics.setColor(255, 255, 255, 255)

	    local trace = debug.traceback()

	    love.graphics.clear()
	    love.graphics.origin()

	    local err = {}

	    table.insert(err, "Oh b'y we right done 'er this time, eh?")
		table.insert(err, "Sorry 'boot that, let's 'ave a look under the hood shall we?\n")
	    table.insert(err, msg.."\n\n")

	    for l in string.gmatch(trace, "(.-)\n") do
	        if not string.match(l, "boot.lua") then
	            l = string.gsub(l, "stack traceback:", "Traceback\n")
	            table.insert(err, l)
	        end
	    end

	    local p = table.concat(err, "\n")

	    p = string.gsub(p, "\t", "")
	    p = string.gsub(p, "%[string \"(.-)\"%]", "%1")

	    local function draw()
	        love.graphics.clear()
	        love.graphics.printf(p, 70, 70, love.graphics.getWidth() - 70)
	        love.graphics.present()
	    end

	    while true do
	        love.event.pump()

	        for e, a, b, c in love.event.poll() do
	            if e == "quit" then
	                return
	            end
	            if e == "keypressed" and a == "escape" then
	                return
	            end
	        end

	        draw()

	        if love.timer then
	            love.timer.sleep(0.1)
	        end
	    end

	end
end
