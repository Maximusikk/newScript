-- Скачивание и запуск первого скрипта в модуле
spawn(function()
    local godsystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/godsystem.lua"))()
    -- Запуск кода или функций из godsystem
end)

-- Задержка, затем запуск второго скрипта
wait(10)

spawn(function()
    local subfarm = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/subfarm.lua"))()
    -- Запуск кода или функций из subfarm
end)
