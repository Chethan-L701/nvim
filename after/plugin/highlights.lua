CurrentSchemeMode = ""
set_mode = function()
    local rmode = io.open("/Users/Cheth/.config/wezterm/mode.txt", "r")
    if rmode then
        local scheme_mode = rmode:read("*a")
        if CurrentSchemeMode == scheme_mode then
            return
        else
            CurrentSchemeMode = scheme_mode
        end

        if defscheme == "rose-pine" then
            if scheme_mode == 'dark' then
                ApplyColorscheme("rose-pine-moon")
            else
                ApplyColorscheme("rose-pine-dawn")
            end
        elseif defscheme == "catppuccin" then
            if scheme_mode == 'dark' then
                ApplyColorscheme("catppuccin")
            else
                ApplyColorscheme("catppuccin-latte")
            end
        elseif defscheme == "tokyonight" then
            if scheme_mode == 'dark' then
                ApplyColorscheme("tokyonight-storm")
            else
                ApplyColorscheme("tokyonight-day")
            end
        end
    end
end


local rtheme = io.open("/Users/Cheth/.config/wezterm/theme.txt", "r")
if rtheme then
    defscheme = rtheme:read("a")
end


ApplyColorscheme(defscheme)
