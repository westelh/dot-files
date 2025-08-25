vim.filetype.add({
  extension = {
    -- Map .tf to terraform file
    -- No need to treat it as TF MUD file
    tf = "terraform"
  },
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
  },
})

