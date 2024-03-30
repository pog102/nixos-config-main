(binding_set
  (binding
    attrpath: (attrpath) @_attribute
    expression: (indented_string_expression
                  (string_fragment) @injection.content))
  (#set! injection.language "sh")
  (#eq? @_attribute "programs.zsh.initExtra"))
