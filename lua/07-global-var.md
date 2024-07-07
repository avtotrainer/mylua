### გლობალური ცვლადების გამოყენების ინსტრუქცია Lua-ში

ეს ინსტრუქცია გაჩვენებთ, როგორ გამოიყენოთ Love2D-ის გლობალური ცვლადები Lua Language Server-თან ერთად, Neovim-ის გამოყენებით NvChad კონფიგურაციაში. ჩვენ შევქმნით `.luarc.json` ფაილს და Lua Language Server-ის კონფიგურაციის ფაილს.

### 1. პროექტის კონფიგურაცია `.luarc.json` ფაილით

#### 1.1. შექმენით `.luarc.json` ფაილი

პროექტის ძირეულ დირექტორიაში შექმენით `.luarc.json` ფაილი შემდეგი შინაარსით:

```json
{
  "diagnostics": {
    "globals": ["love"]
  }
}
```

### 2. Lua Language Server-ის კონფიგურაცია NvChad-ში

#### 2.1. Lua Language Server-ის კონფიგურაციის ფაილი

შექმენით ან დაარედაქტირეთ ფაილი `lua/plugins/lua_ls.lua` შემდეგი შინაარსით:

```lua
-- lua/plugins/lua_ls.lua
local lspconfig = require'lspconfig'

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'love'}
            }
        }
    }
}
```

### სრული ინსტრუქცია

1. **შექმენით ან დაარედაქტირეთ `.luarc.json` ფაილი**:
   პროექტის ძირეულ დირექტორიაში შექმენით `.luarc.json` ფაილი შემდეგი შინაარსით:

   ```json
   {
     "diagnostics": {
       "globals": ["love"]
     }
   }
   ```

2. **Lua Language Server-ის კონფიგურაციის ფაილი NvChad-ში**:
   შექმენით ან დაარედაქტირეთ ფაილი `lua/plugins/lua_ls.lua` შემდეგი შინაარსით:

   ```lua
   -- lua/plugins/lua_ls.lua
   local lspconfig = require'lspconfig'

   lspconfig.sumneko_lua.setup {
       settings = {
           Lua = {
               diagnostics = {
                   globals = {'love'}
               }
           }
       }
   }
   ```

ამ ინსტრუქციებით, თქვენ შეძლებთ Lua Language Server-ის კონფიგურაციას Love2D-ის გლობალური ცვლადების აღსანიშნავად, თქვენს NvChad კონფიგურაციასთან შესაბამისობაში. ეს უზრუნველყოფს, რომ თქვენი Lua Language Server სწორად აღიქვამს `love` გლობალურ ცვლადებს და აღარ გამოგიტანთ შეცდომებს undefined global `love`-ის შესახებ.
