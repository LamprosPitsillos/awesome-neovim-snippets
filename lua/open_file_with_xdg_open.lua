--[[
-- Contributor: LamprosPitsillos
-- Date : 2023-05-02
-- Description : A small autocommand to open pdfs using neovim from your xdg assigned viewer
--]]

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
    pattern = "*.pdf",
    callback = function(ev)
        local filename = ev.file
        vim.fn.jobstart({ "xdg-open", filename }, { detach = true })
        -- require("mini.bufremove").delete(0, false) 
        -- Using mini.remove results in the layout staying consistent
        vim.api.nvim_buf_delete(0,{})

    end
})
