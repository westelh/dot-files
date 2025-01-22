local open = function(it)
  vim.fn.system("open " .. it)
end

return {
  open = open
}

