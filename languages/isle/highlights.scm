["(" ")"] @punctuation.bracket

["@"] @operator

(comment) @comment

(ident) @variable
((ident) @type
  (#match? @type "^[A-Z]"))
((ident) @constant
  (#match? @constant "^[A-Z].*\."))

[
  (ty)
  (model_ty)
] @type

[
  (const_ident)
  (bv_const)
] @constant

(int) @number
(bool) @boolean
(wildcard) @keyword

(_ op: _ @keyword)
(_ modifier: _ @keyword
  (#match? @keyword "(extern|nodebug|infallible)"))
(_ kind: _ @keyword
  (#match? @keyword "(const|constructor|extractor|type|enum)"))

(type_enum_variant
  name: (ident) @constant)
(type_enum_variant_field
  name: (ident) @property)

(decl name: (ident) @function)
(decl modifier_pure: _ @keyword)
(decl modifier_multi: _ @keyword)
(decl modifier_partial: _ @keyword)

(extractor
  term: (ident) @function)

(extern_constructor
  name: (ident) @function
  fn: (ident) @function)
(extern_extractor
  name: (ident) @function
  fn: (ident) @function)

(convert
  name: (ident) @function)

(model_enum_variant
  name: (ident) @constant)

(form
  name: (ident) @function)

(spec_term
  name: (ident) @function)
(switch
  op: _ @function)
(spec_operation
  op: _ @function)

(instantiate
  term: (ident) @function)
