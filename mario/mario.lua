-- mario.lua
-- Mario-ს პერსონაჟის მოდული

-- ვქმნით ცარიელ ცრილს Mario-სთვის და ვაძლევთ მას ინდექსს

local Mario = {}
Mario.__index = Mario

-- ფუნქცია Mario-ს შექმნისთვის
function Mario:create(x, y, imagePaths)
	-- ვქმნით ცარიელ ობიექტს
	local mario = {}
	-- ვქმნით Mario-ს ობიექტს
	setmetatable(mario, Mario)
	-- ვაძლევთ Mario-ს საწყის პოზიციას
	mario.x = x
	mario.y = y
	mario.images = {
		love.graphics.newImage(imagePaths.walk),
		love.graphics.newImage(imagePaths.idle),
		love.graphics.newImage(imagePaths.jump),
	}
	mario.currentImage = mario.images.idle
	mario.frame = 1
	mario.timer = 0
	mario.frameDuration = 0.1
	mario.frames = {}
	local image = mario.images.walk
	local width = image:getWidth() / 3
	local height = image:getHeight()
	for i = 0, 2 do
		table.insert(mario.frames, love.graphics.newQuad(i * Width, 0, width, height, image:getDimensions()))
	end

	-- mario.image = mario.currentImage
	-- ვაძლევთ Mario-ს ზომებს
	mario.width = width
	mario.height = height
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
	local moving = false
	-- თუ მარცხენა ღილაკი დაჭერილია
	if love.keyboard.isDown("left") then
		-- ვამცირებთ x კოორდინატს, რათა Mario მარცხნივ გადავიდეს
		self.x = self.x - self.speed * dt
		self.currentImage = self.images.walk
		-- self.frame = 1
		moving = true
	-- თუ მარჯვენა ღილაკი დაჭერილია
	elseif love.keyboard.isDown("right") then
		-- ვზრდით x კოორდინატს, რათა Mario მარჯვნივ გადავიდეს
		self.x = self.x + self.speed * dt
		self.currentImage = self.images.walk
		-- self.frame = 1
		moving = true
	else
		self.currentImage = self.images.idle
	end

	if moving then
		self.timer = self.timer + dt
		if self.timer > self.frameDuration then
			self.timer = self.timer - self.frameDuration
			self.frame = self.frame % #self.frames + 1
		end
	else
		self.frame = 1
	end
	-- ვერტიკალური მოძრაობა
	if self.isJumping then
		-- ვამატებთ გრავიტაციის ძალას ვერტიკალურ სიჩქარეზე
		self.dy = self.dy + self.gravity * dt
		-- ვცვლით მარიოს ვერტიკალურ პოზიციას
		self.y = self.y - self.dy * dt
		self.currentImage = self.images.jump
		-- მიწაზე დაბრუნების შემთხვევაში
		if self.y > 100 then
			self.y = 100
			self.dy = 0
			self.isJumping = false
			self.currentImage = self.images.idle
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
	if self.currentImage == self.images.walk then
		love.graphics.draw(self.currentImage, self.frames[self.frame], self.x, self.y)
	else
		love.graphics.draw(self.currentImage, self.x, self.y)
	end
end

-- ვაბრუნებთ Mario-ს მოდულს
return Mario
