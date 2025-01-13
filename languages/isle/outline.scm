(type
  "type" @context
  name: (_) @name
) @item

(decl
  "decl" @context
  "pure"? @context
  "multi"? @context
  "partial"? @context
  name: (_) @name
) @item

(rule
  "rule" @context
  (pattern_term . (ident) @name)
) @item

(extractor
  "extractor" @context
  term: (_) @name
) @item

(extern_const
  "extern" @context
  "const" @context
  name: (_) @name
) @item

(extern_constructor
  "extern" @context
  "constructor" @context
  name: (_) @name
) @item

(extern_extractor
  "extern" @context
  "extractor" @context
  name: (_) @name
) @item

(convert
  "convert" @context
  name: (_) @name
) @item

(model
  "model" @context
  name: (_) @name
) @item

(form
  "form" @context
  name: (_) @name
) @item

(spec
  "spec" @context
  (spec_term
    name: (_) @name)
) @item

(instantiate
  "instantiate" @context
  term: (_) @name
) @item

(comment) @annotation
