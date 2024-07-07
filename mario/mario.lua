-- mario.lua
-- Mario-ს პერსონაჟის მოდული

-- ვქმნით ცარიელ ცრილს Mario-სთვის და ვაძლევთ მას ინდექსს
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
	-- ვერტიკალური სიჩქარე
	mario.dy = 0
	-- გრავიტაცია, რომელიც მარიოს მიწაზე აბრუნებს
	mario.gravity = -500
	-- ახტომის ძალა
	mario.jumpStrength = 300
	-- ახტომის მდგომარეობა (მიმდინარეობს თუ არა იახტომა)
	mario.isJumping = false
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
	-- ვერტიკალური მოძრაობა
	if self.isJumping then
		-- ვამატებთ გრავიტაციის ძალას ვერტიკალურ სიჩქარეზე
		self.dy = self.dy + self.gravity * dt
		-- ვცვლით მარიოს ვერტიკალურ პოზიციას
		self.y = self.y - self.dy * dt

		-- მიწაზე დაბრუნების შემთხვევაში
		if self.y > 100 then
			self.y = 100
			self.dy = 0
			self.isJumping = false
		end
	end
end
--ფუნქცია მარიოს ახტომისათვის
function Mario:jump()
	-- თუ მარიო არ ხტება, ვიწყებთ ახტომას
	if not self.isJumping then
		self.dy = self.jumpStrength
		self.isJumping = true
	end
end
--: ფუნქცია Mario-ს დასახატად
function Mario:draw()
	-- ვხატავთ Mario-ს როგორც შავს კვადრატს
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- ვაბრუნებთ Mario-ს მოდულს
return Mario
