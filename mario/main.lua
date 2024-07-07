-- main.lua
-- Mario-ს პერსონაჟის ჩატვირთვა
local Mario = require("mario")

-- მენიუს მდგომარეობა
local menuActive = false

-- love.load ფუნქცია გამოიყენება თამაშის დასაწყებად
function love.load()
	-- ვქმნით Mario-ს ობიექტს საწყისი პოზიციით (100, 100)
	mario = Mario:create(100, 100)
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
	end
end
