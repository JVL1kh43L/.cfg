"Disable the print key for MacVim.
if has("gui_macvim")
macmenu &File.Print key=<nop>
endif
