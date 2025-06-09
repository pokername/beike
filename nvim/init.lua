require("config.lazy")


vim.g.tex_flavor = "latex"



local opt = vim.opt
opt.termguicolors = true
vim.cmd([[colorscheme vim]])
-- opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt.clipboard = "unnamedplus"
opt.scrolloff = 999
opt.showcmd = true
opt.expandtab = true	
opt.shiftwidth = 2
opt.smartindent	= true
opt.hlsearch = false
opt.autowrite = true


vim.o.guicursor = 'i:block'


local opts = {noremap = true, silent = true}

vim.keymap.set({'i', 'n'}, '<Space><Space>', '<Esc>/<++><Enter>"_c4l')
vim.keymap.set({'i', 'n'}, ';<Space><Space>', '<Esc>?<++><Enter>"_c4l')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('c', 'jj', 'e .bashrc<CR>')


vim.keymap.set('n', '<leader>p', '<plug>MarkdownPreviewToggle')


vim.cmd([[
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif 
]])


    vim.api.nvim_create_autocmd('TextYankPost', {
      callback = function() vim.highlight.on_yank() end,
      desc = "Briefly highlight yanked text"
    })

-- latex
vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  callback = function()
		vim.keymap.set('i', ';up', '\\usepackage{}<++><Esc>F}i')
		vim.keymap.set('i', ';toc', '\\tableofcontents')
		vim.keymap.set('i', ';ii', '\\item <Space>')
		vim.keymap.set('i', ';ci', '\\cite{}<++><Esc>F}i')
    --
		vim.keymap.set('i', ';1', '\\section{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ';2', '\\subsection{}<Enter><Enter><++><Esc>2kf}i')
		vim.keymap.set('i', ';3', '\\subsubsection{}<Enter><Enter><++><Esc>2kf}i')
    --
		vim.keymap.set('i', ';tb', '\\textbf{}<++><Esc>F}i')
		vim.keymap.set('i', ';bf', '{\\bfseries }<++><Esc>F}i')
		vim.keymap.set('v', ';bf', ":<C-u>'>s/$/}/|'<s/^/{\\\\bfseries /<CR>")
		vim.keymap.set('v', 'ff', ":<C-u>'>s/$/}/|'<s/^/{\\\\<++> /<CR>")
		vim.keymap.set('v', ';tb', ':s/\\%V\\(.*\\)\\%V/\\\\textbf{\\1}<CR>')
		vim.keymap.set('i', ';ti', '\\textit{}<++><Esc>F}i')
		vim.keymap.set('v', ';ti', ':s/\\%V\\(.*\\)\\%V/\\\\textit{\\1}<CR>')
		vim.keymap.set('i', ';ul', '\\underline{}<++><Esc>F}i')
		vim.keymap.set('v', ';ul', ':s/\\%V\\(.*\\)\\%V/\\\\underline{\\1}<CR>')
		vim.keymap.set('i', ';c', '\\textcolor{}{<++>}<++><Esc>2F}i')
		vim.keymap.set('v', ';c', ':s/\\%V\\(.*\\)\\%V/\\\\textcolor{red}{\\1}<CR>')
    --
		vim.keymap.set('i', ';be', '\\begin{sikao}<Enter><++><Enter>\\end{sikao}<Enter><++><Esc>V3k:s/sikao/')
		vim.keymap.set('i', ';fr', '\\begin{frame}<Enter><Enter>\\end{frame}<Enter><++><Esc>kki')
		vim.keymap.set('v', ';fr', ":<C-u>'>s/$/\\r\\\\end{frame}/|'<s/^/\\\\begin{frame}\\r/<CR>")
		vim.keymap.set('v', ';mp', ":<C-u>'>s/$/\\r\\\\end{minipage}/|'<s/^/\\\\begin{minipage}\\r/<CR>")
		vim.keymap.set('v', ';os', ":<C-u>'>s/$/\\r}/|'<s/^/\\\\onslide<<++>>{\\r/<CR>")
		vim.keymap.set('v', ',fr', ":s/^\\(.*\\)$/\\\\begin{frame}\\r\\1\\r\\\\end{frame}<Enter>", opts)
		vim.keymap.set('v', ',os', ":s/^\\(.*\\)$/\\\\onslide<<++>>{\\1}<Enter>", opts)
		vim.keymap.set('v', ';fg', ":s/^\\(.*\\)$/\\\\begin{figure}\\r\\1\\r\\\\end{figure}<Enter>", opts)
		vim.keymap.set('i', ';fg', "\\begin{figure}[htbp]<Enter>\\centering<Enter>\\includegraphics[width=]{<++>}<Enter>\\caption{<++>}<Enter>\\label{fig:<++>}<Enter>\\end{figure}<Enter><++><Esc>4kf]i", opts)
		vim.keymap.set('v', 'ig', ":s/^\\(.*\\)$/\\\\includegraphics{\\1}<Enter>", opts)
		vim.keymap.set('i', ';ig', "\\includegraphics[width=]{<++>}<CR><++><Esc>kf]i", opts)
		vim.keymap.set('i', ';en', '\\begin{enumerate}<Enter><Enter>\\end{enumerate}<Enter><++><Esc>kki')
		vim.keymap.set('i', ';tb', '\\begin{tabular}{}<Enter><++><Enter>\\end{tabular}<Enter><++><Esc>kkk2f}i')
		vim.keymap.set('i', ';ta', '\\begin{table}[htbp]<Enter>\\caption{}<Enter>\\label{tab:<++>}<Enter>\\centering<Enter>\\begin{tabular}{ccc}<Enter>\\hline<Enter><++><Space>&<Space><++><Space>&<Space><++><Space>\\\\<Enter>\\end{tabular}<Enter>\\end{table}<Enter><++><Esc>8kf{a')
		vim.keymap.set('i', 'ii', '$$<++><Esc>F$i')
		vim.keymap.set('v', 'ii', ':s/\\%V\\(.*\\)\\%V/$<Space>\\1<Space>$<CR>')
    vim.keymap.set('c', 'ii', "s/^\\(.*\\)$/$<Space>\\1<Space>$")
		vim.keymap.set('v', 'os', ':s/\\%V\\(.*\\)\\%V/\\\\onslide<<++>>{\\1}<CR>')
		vim.keymap.set('v', 'al', ':s/\\%V\\(.*\\)\\%V/\\\\alert<<++>>{\\1}<CR>')
		vim.keymap.set('i', 'dd', '\\[<Enter><Enter>\\]<Enter><++><Esc>2ki')
    -- math
		vim.keymap.set('i', ';dc', '\\si{\\degreeCelsius}')
		vim.keymap.set('i', ';t', '\\text{}<++><Esc>F}i')
		vim.keymap.set('i', ';s', '^{}<++><Esc>F}i')
		vim.keymap.set('i', ';x', '_{}<++><Esc>F}i')
		vim.keymap.set('i', ';S', '^{}_{<++>}<++><Esc>2F}i')
		vim.keymap.set('i', ';(', '\\left(  \\right)<++><Esc>F i')
		vim.keymap.set('i', ';{', '\\left\\{  \\right\\}<++><Esc>F i')
		vim.keymap.set('i', ';[', '\\left[  \\right]<++><Esc>F i')
		vim.keymap.set('i', ';|', '\\left|  \\right|<++><Esc>F i')
		vim.keymap.set('i', ';X', '\\times')
		vim.keymap.set('i', '.c', '\\cdot')
		vim.keymap.set('i', '.l', '\\ldots')
		vim.keymap.set('i', '.v', '\\vdots')
		vim.keymap.set('i', '.d', '\\ddots')
		vim.keymap.set('i', '->', '\\rightarrow')
		vim.keymap.set('i', '<-', '\\leftarrow')
		vim.keymap.set('i', '-->', '\\xrightarrow[]{<++>}<++><Esc>F]i')
		vim.keymap.set('i', '<--', '\\xleftarrow[]{<++>}<++><Esc>F]i')
		vim.keymap.set('i', ';a', '\\alpha')
		vim.keymap.set('i', ';b', '\\beta')
		vim.keymap.set('i', ';y', '\\gamma')
		vim.keymap.set('i', ';p', '\\rho')
		vim.keymap.set('i', ';u', '\\mu')
		vim.keymap.set('i', ';e', '\\partial')
		vim.keymap.set('i', ';=', '<Space>&=<Space>')
		vim.keymap.set('i', ';sq', '\\sqrt[]{<++>}<++><Esc>F]i')
		vim.keymap.set('i', ';f', '\\frac{}{<++>}<++><Esc>2F}i')
    --
		vim.keymap.set('v', ';nh', ':s/\\%V\\(.*\\)\\%V/\\\\tikzmarknode{<++>}{\\\\highlight{<++>}{$\\1$}}<Enter>')
		vim.keymap.set('i', ';tp', '\\begin{tikzpicture}[overlay,remember<Space>picture,>=stealth,nodes={align=left,inner<Space>ysep=1pt},<-]<Enter><Enter>\\end{tikzpicture}<Enter><++><Esc>2ki')
		vim.keymap.set('i', ';ru', '\\path<Space>(<++>.north)<Space>++<Space>(0,2em)<Space>node[anchor=south<Space>west,color=red!67]<Space>(<++>_node){\\textbf{<++>}};<Enter>\\draw<Space>[color=red!57](<++>.north)<Space>|-<Space>([xshift=-0.3ex,color=red]<++>_node.south<Space>east);<Enter><++><Esc>3k')
		vim.keymap.set('i', ';lu', '\\path<Space>(<++>.north)<Space>++<Space>(0,2em)<Space>node[anchor=south<Space>east,color=orange!67]<Space>(<++>_node){\\textbf{<++>}};<Enter>\\draw<Space>[color=orange!57](<++>.north)<Space>|-<Space>([xshift=-0.3ex,color=orange]<++>_node.south<Space>west);<Enter><++><Esc>3k')
		vim.keymap.set('i', ';rd', '\\path<Space>(<++>.south)<Space>++<Space>(0,-2em)<Space>node[anchor=north<Space>west,color=green!67]<Space>(<++>_node){\\textbf{<++>}};<Enter>\\draw<Space>[color=green!57](<++>.south)<Space>|-<Space>([xshift=-0.3ex,color=green]<++>_node.south<Space>east);<Enter><++><Esc>3k')
		vim.keymap.set('i', ';ld', '\\path<Space>(<++>.south)<Space>++<Space>(0,-2em)<Space>node[anchor=north<Space>east,color=blue!67]<Space>(<++>_node){\\textbf{<++>}};<Enter>\\draw<Space>[color=blue!57](<++>.south)<Space>|-<Space>([xshift=-0.3ex,color=blue]<++>_node.south<Space>west);<Enter><++><Esc>3k')
    --
		vim.keymap.set('i', ';dr', '\\draw<Space>()<Space><++><Space>(<++>);<++><Esc>2F)i')
		vim.keymap.set('i', ';fi', '\\fill<Space>()<Space><++><Space>(<++>);<++><Esc>2F)i')
		vim.keymap.set('i', ';fd', '\\filldraw<Space>()<Space><++><Space>(<++>);<++><Esc>2F)i')
		vim.keymap.set('i', ';no', '\\node[]<Space>(<++>)<Space>at<Space>(<++>)<Space>{<++>};<++><Esc>F]i')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
		vim.keymap.set('i', ';tb', '****<++><Esc>2F*i')
		vim.keymap.set('v', ',tb', ':s/\\%V\\(.*\\)\\%V/**\\1**<++><CR>')
		-- vim.keymap.set('v', ',tb', 'c****<Esc>2F*P')
		-- vim.keymap.set('i', '~', '~~~~<++><Esc>2F~i')
		vim.keymap.set('i', ';bi', '******<Esc>3F*i')
		vim.keymap.set('v', ',bi', ':s/\\%V\\(.*\\)\\%V/***\\1***<++><CR>')
		-- vim.keymap.set('v', ',bi', 'c******<Esc>3F*P')
		vim.keymap.set('i', ';ti', '**<++><Esc>F*i')
		vim.keymap.set('v', ',ti', ':s/\\%V\\(.*\\)\\%V/*\\1*<++><CR>')
		-- vim.keymap.set('v', ',ti', 'c**<++><Esc>F*P')
		vim.keymap.set('i', 'ii', '$$<++><Esc>F$i')
		vim.keymap.set('i', 'dd', '$$<Enter><Enter>$$<Enter><++><Esc>2ki')
		vim.keymap.set('i', '`', '``<++><Esc>F`i')
		vim.keymap.set('i', ';`', '```<Enter><++><Enter>```<++><Esc>kka')
		vim.keymap.set('i', ';m', '```mermaid<Enter><Enter>```<Enter><++><Esc>2ki')
		vim.keymap.set('i', ';l', '[](<++>)<++><Esc>F]i')
		vim.keymap.set('i', ';pi', '![](<++>)<++><Esc>F]i')
    --    
		vim.keymap.set('i', ';1', '#<Space><Enter><Enter><++><Esc>2kA')
		vim.keymap.set('i', ';2', '##<Space><Enter><Enter><++><Esc>2kA')
		vim.keymap.set('i', ';3', '###<Space><Enter><Enter><++><Esc>2kA')
		vim.keymap.set('i', ';4', '#####<Space><Enter><Enter><++><Esc>2kA')
    --
		vim.keymap.set('i', ';s', '^{}<++><Esc>F}i')
		vim.keymap.set('i', ';x', '_{}<++><Esc>F}i')
		vim.keymap.set('i', ';S', '^{}_{<++>}<++><Esc>2F}i')
		vim.keymap.set('i', ';X', '\\times')
		vim.keymap.set('i', ';a', '\\alpha')
		vim.keymap.set('i', ';b', '\\beta')
		vim.keymap.set('i', ';y', '\\gamma')
		vim.keymap.set('i', ';p', '\\rho')
		vim.keymap.set('i', ';=', '<Space>&=<Space>')
		vim.keymap.set('i', ';fr', '\\frac{}{<++>}<++><Esc>2F}i')
		vim.keymap.set('i', ';al', '\\begin{align}<Enter>%&=\\\\<Enter>\\end{align}<Enter><++><Esc>kO')
		vim.keymap.set('i', ';ga', '\\begin{gather}<Enter>%\\\\<Enter>\\end{gather}<Enter><++><Esc>kO')
		vim.keymap.set('i', ';ta', '|<Space><++><Space>|<Space><++><Space>|<Space><++><Space>|')
		vim.keymap.set('i', ';ce', '\\ce{}<++><Esc>F}i')
    --
		vim.keymap.set('i', ';ajmd', 'F_{浮} = \\rho_{液}gV_{排}')
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
		vim.keymap.set('i', '{{', '{}<++><Esc>F}i')
		vim.keymap.set('i', '((', '()<++><Esc>F)i')
		vim.keymap.set('i', "''", "''<++><Esc>F'i")
		vim.keymap.set('i', '[[', '[]<++><Esc>F]i')
		vim.keymap.set('i', '""', '""<++><Esc>F"i')
		vim.keymap.set({'i', 'n'}, '<leader>c', '<Esc>:w|!compiler<space>"%"<CR>')
		vim.keymap.set({'i', 'n'}, '<leader>p', '<Esc>:w|!opout<space>"%"<CR>')
  end,
})

