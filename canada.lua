-- http://i.imgur.com/RkLJFVh.jpg
if love then
	if love.filesystem then
		love.filesystem.directoryEh	= love.filesystem.isDirectory
		love.filesystem.fileEh		= love.filesystem.isFile
		love.filesystem.fusedEh		= love.filesystem.isFused
	end

	if love.graphics then
		love.graphcis.supportedEh	= love.graphics.isSupported
		love.graphics.wireframeEh	= love.graphics.isWireframe
	end

	if love.image then
		love.image.compressedEh		= love.image.isCompressed
	end

	if love.keyboard then
		love.keyboard.downEh		= love.keyboard.isDown
		love.keyboard.keyRepeatEh	= love.keyboard.hasKeyRepeat
		love.keyboard.textInputEh	= love.keyboard.hasTextInput
	end

	if love.math then
		love.math.convexEh			= love.math.isConvex
	end

	if love.mouse then
		love.mouse.downEh			= love.mouse.isDown
		love.mouse.grabbedEh		= love.mouse.isGrabbed
		love.mouse.visibleEh		= love.mouse.isVisible
	end

	if love.window then
		love.window.createdEh		= love.window.isCreated
		love.window.visibleEh		= love.window.isVisible
		love.window.focusEh			= love.window.hasFocus
		love.window.mouseFocusEh	= love.window.hasMouseFocus
	end
end
