LÖVE, Eh?
==
LÖVE, Eh? is a drop-in localization of the LÖVE API from en_US to en_CA. Make sure yor requirin' canada in your conf file though, eh? Otherwise the error handlin' won' be workin so good.

Quick Example
--
```lua     
-- conf.lua
require "canada"

-- main.lua
function love.update(dt)
	if love.mouse.downEh("l") then
		print("Left mouse is down, eh?")
	end
end
```

License
--
This code is licensed under the [**MIT Open Source License**][MIT]. Check out the LICENSE file for more information.

[MIT]: http://www.opensource.org/licenses/mit-license.html
