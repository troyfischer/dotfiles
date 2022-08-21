local options = {
  backup = false,                          
  clipboard = "unnamedplus",               
  cmdheight = 2,                           
  completeopt = { "menuone", "noselect" }, 
  conceallevel = 0,                        
  fileencoding = "utf-8",                  
  hlsearch = true,                         
  incsearch = true,
  ignorecase = true,                       
  mouse = "a",                             
  pumheight = 10,                          
  showmode = false,                        
  showtabline = 2,                         
  smartcase = true,                        
  smartindent = true,                      
  splitbelow = true,                       
  splitright = true,                       
  swapfile = false,                        
  termguicolors = false,                   
  timeoutlen = 100,                        
  undofile = true,                         
  updatetime = 300,                        
  writebackup = false,                     
  tabstop = 4,                             
  shiftwidth = 4,                          
  expandtab = true,                        
  softtabstop = 4,
  cursorline = true,                       
  number = true,                           
  relativenumber = false,                  
  numberwidth = 4,                         
  signcolumn = "no",
  wrap = false,                            
  scrolloff = 8,                           
  sidescrolloff = 8,
  guifont = "monospace:h17",               
  belloff = "all",
  joinspaces = false,
  foldmethod = "marker",
  foldlevel = 0,
  modelines = 1,
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.formatoptions = vim.opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore



vim.cmd "set whichwrap+=<,>[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.cmd("autocmd BufEnter * set formatoptions-=o")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=o")
