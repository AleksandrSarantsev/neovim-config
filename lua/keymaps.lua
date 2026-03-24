local M = {}

function tselect_word()                    -- Get the word under the cursor and execute :tselect with it
    local word = vim.fn.expand("<cword>")  -- Get word under cursor
    vim.cmd("tselect " .. word)            -- Can use tjump to go single defined tag or select if multiple present
end

function M.setup()
    -- Free keys: j, k, l, n, o, p, r, u, w, y, z
    vim.keymap.set("n", "<Leader>b" , ":Pick buffers<CR>"                   , {desc = "Open buffers picker"          })
    vim.keymap.set("n", "<Leader>c" , ":bd!<CR>"                            , {desc = "Close buffer without save"    })
    vim.keymap.set("n", "<Leader>d" , ":lua MiniDiff.toggle_overlay()<CR>"  , {desc = "Toggle diff overlay"          })
    vim.keymap.set("n", "<Leader>e" , ":Pick explorer<CR>"                  , {desc = "Open file explorer"           })
    vim.keymap.set("n", "<Leader>f" , ":Pick files<CR>"                     , {desc = "Open file picker"             })
    vim.keymap.set("n", "<Leader>g" , ":Pick grep_live<CR>"                 , {desc = "Open live grep picker"        })
    vim.keymap.set("n", "<Leader>h" , ":noh<CR>"                            , {desc = "Turn off search highlights"   })
    vim.keymap.set("n", "<Leader>i" , ":lua vim.diagnostic.open_float()<CR>", {desc = "Show diagnostic info"         })
    vim.keymap.set("n", "<Leader>m" , ":Pick marks<CR>"                     , {desc = "Open marks picker"            })
    vim.keymap.set("n", "<Leader>q" , ":qa!<CR>"                            , {desc = "Close all without save"       })
    vim.keymap.set("n", "<Leader>s" , ":Pick spellsuggest<CR>"              , {desc = "Open spell suggestions picker"})
    vim.keymap.set("n", "<Leader>t" , tselect_word                          , {desc = "Show tag list definitions"    })
    vim.keymap.set("n", "<Leader>v" , ":Pick visit_paths<CR>"               , {desc = "Open visited files picker"    })
    vim.keymap.set("n", "<Leader>x" , ":xa!<CR>"                            , {desc = "Close all with save"          })
end

return M

-- -- Can be used with vimui select to 
-- local function get_tag_info(tagname)
--   -- Получаем список всех совпадений для тега
--   local tags = vim.fn.taglist(tagname)
--   
--   if #tags == 0 then
--     print("Тег не найден")
--     return nil
--   end
-- 
--   -- Берем первое совпадение
--   local tag = tags[1]
--   
--   return {
--     file = tag.filename,      -- Путь к файлу
--     pattern = tag.static and tag.cmd or tag.cmd, -- Обычно это /^...$/ (шаблон поиска)
--     kind = tag.kind           -- Тип (f - функция, v - переменная и т.д.)
--   }
-- end
-- 
-- -- Использование:
-- local info = get_tag_info("my_function_name")
-- if info then
--   print("Файл: " .. info.file)
--   print("Поиск: " .. info.pattern)
-- end
-- local function jump_to_tag_in_file(tagname, target_file)
--   local tags = vim.fn.taglist(tagname)
--   
--   for _, tag in ipairs(tags) do
--     -- Проверяем, совпадает ли имя файла (можно использовать string.find для частичного совпадения)
--     if tag.filename:find(target_file, 1, true) then
--       -- 1. Открываем файл
--       vim.cmd("edit " .. vim.fn.fnameescape(tag.filename))
--       -- 2. Переходим к позиции. tag.cmd — это обычно поисковый паттерн /^...$/
--       -- Убираем первый и последний символы (обычно / и /), если это не номер строки
--       local cmd = tag.cmd:gsub("^/", ""):gsub("/$", "")
--       vim.cmd(cmd)
--       return true
--     end
--   end
--   print("Тег в указанном файле не найден")
--   return false
-- end
-- 
-- -- Использование:
-- jump_to_tag_in_file("MyFunction", "internal/db/utils.go")


