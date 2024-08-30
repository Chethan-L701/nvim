local timer = vim.loop.new_timer()
timer:start(0, 500, vim.schedule_wrap(function()
    set_mode()
end))
