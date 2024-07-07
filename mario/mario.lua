-- mario.lua
-- Mario-ს პერსონაჟის მოდული

-- ვქმნით ცარიელ მაგიდას Mario-სთვის და ვაძლევთ მას ინდექსს
Mario = {}
Mario.__index = Mario

-- ფუნქცია Mario-ს შექმნისთვის
function Mario:create(x, y)
	-- ვქმნით ცარიელ ობიექტს
	local mario = {}
	-- ვქმნით Mario-ს ობიექტს
	setmetatable(mario, Mario)
	-- ვაძლევთ Mario-ს საწყის პოზიციას
	mario.x = x
	mario.y = y
	-- ვაძლევთ Mario-ს ზომებს
	mario.width = 32
	mario.height = 32
	-- ვაძლევთ Mario-ს სიჩქარეს
	mario.speed = 200
	-- ვაბრუნებთ Mario-ს ობიექტს
	return mario
end

-- ფუნქცია Mario-ს მოძრაობისთვის
function Mario:move(dt)
	-- თუ მარცხენა ღილაკი დაჭერილია
	if love.keyboard.isDown("left") then
		-- ვამცირებთ x კოორდინატს, რათა Mario მარცხნივ გადავიდეს
		self.x = self.x - self.speed * dt
	-- თუ მარჯვენა ღილაკი დაჭერილია
	elseif love.keyboard.isDown("right") then
		-- ვზრდით x კოორდინატს, რათა Mario მარჯვნივ გადავიდეს
		self.x = self.x + self.speed * dt
	end
end

-- ფუნქცია Mario-ს დასახატად
function Mario:draw()
	-- ვხატავთ Mario-ს როგორც შავს კვადრატს
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- ვაბრუნებთ Mario-ს მოდულს
return Mario
