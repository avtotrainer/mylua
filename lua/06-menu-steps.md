გასაგებია! აქ არის კოდი მხოლოდ იმ ნაწილებით, რაც საჭიროა მენიუს და პროგრამიდან გასვლის ფუნქციის დასამატებლად. ასევე მითითებულია, თუ სად უნდა ჩასვათ ეს კოდი `main.lua` ფაილში:

### 1. მენიუს მდგომარეობა

**`main.lua`-ის დასაწყისში დაამატეთ:**

```lua
-- მენიუს მდგომარეობა
local menuActive = false
```

### 2. `love.update` ფუნქციაში ცვლილებები

**`love.update` ფუნქციაში შეცვალეთ არსებული კოდი:**

```lua
function love.update(dt)
    if not menuActive then
        -- ვამოძრავებთ Mario-ს თუ მენიუ არ არის აქტიური
        mario:move(dt)
    end
end
```

### 3. `love.draw` ფუნქციაში ცვლილებები

**`love.draw` ფუნქციაში შეცვალეთ არსებული კოდი:**

```lua
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
```

### 4. `love.keypressed` ფუნქციის დამატება

**`main.lua`-ის ბოლოში დაამატეთ ახალი ფუნქცია:**

```lua
function love.keypressed(key)
    if key == "escape" then
        -- თუ Escape დაჭერილია, ვრთავთ/ვთიშავთ მენიუს
        menuActive = not menuActive
    elseif menuActive and key == "1" then
        -- თუ მენიუ აქტიურია და 1 დაჭერილია, ვხურავთ თამაშს
        love.event.quit()
    end
end
```

### მთლიანად კოდი ცვლილებებით

შედეგად, თქვენი `main.lua` ფაილი გამოიყურება ასე:

```lua
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
```

ამ ცვლილებებით, ბავშვებს შეეძლებათ გაიგონ, თუ როგორ დაამატონ მენიუს ფუნქციონალი და პროგრამიდან გასვლის შესაძლებლობა.
