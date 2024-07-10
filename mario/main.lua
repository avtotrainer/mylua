-- main.lua
-- Mario-ს პერსონაჟის ჩატვირთვა
local Mario = require("mario")

-- მენიუს მდგომარეობა
local menuActive = false
-- Mario-ს ობიეთქტი
local mario

-- გზის ტაილები (ნახატი)
local groundTiles = {}
--
-- love.load ფუნქცია გამოიყენება თამაშის დასაწყებად
function love.load()
	-- ვქმნით Mario-ს ობიექტს საწყისი პოზიციით (100, 100)
	mario = Mario:create(100, 100, {
		walk = love.graphics.newImage("mario_walk.png"),
		idle = love.graphics.newImage("mario_idle.png"),
		jump = love.graphics.newImage("mario_jump.png"),
	})

	-- ვქმნით და ვტვირთავთ გზის ტაილებს
	local tile = love.graphics.newCanvas(32, 32)
	love.graphics.setCanvas(tile)
	love.graphics.clear()
	love.graphics.setColor(139 / 255, 69 / 255, 192 / 255) -- ყავისფერი
	love.graphics.rectangle("fill", 0, 8, 32, 24)

	love.graphics.setColor(34 / 255, 139 / 255, 34 / 255) -- მწვანე
	love.graphics.rectangle("fill", 0, 0, 32, 8)

	love.graphics.setColor(105 / 255, 58 / 255, 16 / 255)
	love.graphics.rectangle("fill", 6, 20, 2, 2)
	love.graphics.rectangle("fill", 14, 14, 2, 2)
	love.graphics.rectangle("fill", 14, 20, 2, 2)
	love.graphics.rectangle("fill", 24, 18, 2, 2)

	love.graphics.setCanvas()
	for i = 1, 10 do
		table.insert(groundTiles, { image = tile, x = i * 32, y = love.graphics.getHeight() - 32 })
	end
end

-- love.update ფუნქცია განახლდება ყოველ კადრზე
function love.update(dt)
	if not menuActive then
		-- ვამოძრავებთ Mario-ს თუ მენიუ არ არის აქტიური
		mario:move(dt)
	end
end

-- love.draw ფუნქცია გამოიყენება გრაფიკის დასახატად
function love.draw()
	if not menuActive then
		-- ვხატავთ გზის ტაილებს
		for _, tile in ipairs(groundTiles) do
			love.graphics.draw(tile.image, tile.x, tile.y)
		end
		-- ვხატავთ Mario-ს ეკრანზე თუ მენიუ არ არის აქტიური
		mario:draw()
	else
		-- ვხატავთ მენიუს
		love.graphics.print("Menu", 100, 100)
		love.graphics.print("1. Exit", 100, 120)
	end
end

-- love.keypressed ფუნქცია გამოიყენება ღილაკის დაჭერისთვის
function love.keypressed(key)
	if key == "escape" then
		-- თუ Escape დაჭერილია, ვრთავთ/ვთიშავთ მენიუს
		menuActive = not menuActive
	elseif menuActive and key == "1" then
		-- თუ მენიუ აქტიურია და 1 დაჭერილია, ვხურავთ თამაშს
		love.event.quit()
	elseif key == "space" then
		-- თუ პრაბელზეა დაწოლა მარიო ხტება
		mario:jump()
	end
end
