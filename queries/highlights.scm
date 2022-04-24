[
  (comment)
  (pragma)
] @comment

[
  (self)
  (super)
] @variable.builtin

[
  (getter)
  (setter)
  (nonnull)
  (nullable)
  (null_resettable)
  (unsafe_unretained)
  (null_unspecified)
  (direct)
  (readwrite)
  (readonly)
  (strong)
  (weak)
  (copy)
  (assign)
  (retain)
  (atomic)
  (nonatomic)
  (class)
  (NS_NONATOMIC_IOSONLY)
  (DISPATCH_QUEUE_REFERENCE_TYPE)
] @keyword 

[
  "@interface"
  "@protocol"
  "@property"
  "@end"
  "@implementation"
  "@compatibility_alias"
  "@autoreleasepool"
  "@synchronized"
  "@class"
  "@synthesize"
  "@dynamic"
  "@defs"
  "@try"
  "@catch"
  "@finally"
  "@throw"
  "@selector"
  "@encode"
  "@available"
  "__builtin_available"
  (private)
  (public)
  (protected)
  (package)
  (optional)
  (required)
  "NS_ENUM"
  "NS_ERROR_ENUM"
  "NS_OPTIONS"
  (type_qualifier)
  (storage_class_specifier)
  (attribute_specifier)
  (class_interface_attribute_sepcifier)
  (method_variadic_arguments_attribute_specifier)
  "NS_NOESCAPE"
  "const"
  "default"
  "enum"
  "extern"
  "inline"
  "static"
  "struct"
  "typedef"
  "typeof"
  "__typeof"
  "__typeof__"
  "_Atomic"
  "union"
  "volatile"
  "goto"
  "register"
  "__covariant"
  "__contravariant"
  "__GENERICS"
] @keyword

"sizeof" @keyword.operator
"return" @keyword.return

[
  "while"
  "for"
  "do"
  "continue"
  "break"
] @keyword.repeat

"#define" @constant.macro

[
  "#if"
  "#ifdef"
  "#ifndef"
  "#else"
  "#elif"
  "#endif"
  (preproc_directive)
] @keyword

"#include" @include
"#import" @include
"@import" @include

[
  "="

  "-"
  "*"
  "/"
  "+"
  "%"

  "~"
  "|"
  "&"
  "^"
  "<<"
  ">>"

  "->"

  "<"
  "<="
  ">="
  ">"
  "=="
  "!="

  "!"
  "&&"
  "||"

  "-="
  "+="
  "*="
  "/="
  "%="
  "|="
  "&="
  "^="
  ">>="
  "<<="
  "--"
  "++"
  "@"
] @operator

[
 "if"
 "else"
 "case"
 "switch"
] @keyword.conditional

(conditional_expression [ "?" ":" ] @keyword.conditional)

[
 (true)
 (false)
 (YES)
 (NO)
] @keyword.boolean

[ "." ";" ":" "," ] @punctuation.delimiter

"..." @punctuation.special

[ "(" ")" "[" "]" "{" "}"] @punctuation.bracket

[
  (string_literal)
  (string_expression)
  (system_lib_string)
  (module_string)
] @string

(escape_sequence) @string.escape

(null) @constant.builtin
(nil) @constant.builtin
(number_literal) @number
(number_expression) @number
(char_literal) @character

[
 (preproc_arg)
 (preproc_defined)
]  @function.macro

declarator: (identifier) @property
(cast_expression value: (identifier) @property)

(((field_expression
     (field_identifier) @property)) @_parent
 (#not-has-parent? @_parent function_declarator call_expression))

(((field_identifier) @property)
 (#has-ancestor? @property field_declaration)
 (#not-has-ancestor? @property function_declarator))

[
 (type_identifier)
 (primitive_type)
 (sized_type_specifier)
 (type_descriptor)
 (generics_type_reference)
] @type

[
 (id)
 (Class)
 (Method)
 (IMP)
 (SEL)
 (BOOL)
 (instancetype)
 (auto)
] @type.builtin

(declaration (type_qualifier) @type)
(cast_expression type: (type_descriptor) @type)
(sizeof_expression value: (parenthesized_expression (identifier) @type))

(class_interface name: (identifier) @type.class)
(category_interface name: (identifier) @type.class)
(category_interface category: (identifier) @type.category)
(superclass_reference name: (identifier) @type.class)
(parameterized_class_type_arguments) @type.class
(class_implementation name: (identifier) @type.class)
(category_implementation name: (identifier) @type.class)
(compatibility_alias_declaration (identifier) @type.class)
(category_implementation category: (identifier) @type.category)
(class_forward_declaration name: (identifier) @type.class)
(protocol_forward_declaration name: (identifier) @type.protocol)
(protocol_declaration name: (identifier) @type.protocol)
(protocol_qualifiers name: (identifier) @type.protocol)
(protocol_expression (identifier) @type.protocol)

;; Preproc def / undef
(preproc_def
  name: (_) @constant)
(preproc_call
  directive: (preproc_directive) @_u
  argument: (_) @constant
  (#eq? @_u "#undef"))

(call_expression
  function: (identifier) @function)
(field_expression
    field: (field_identifier) @function)
(function_declarator
  declarator: (identifier) @function)
(preproc_function_def
  name: (identifier) @function.macro)
(selector_expression 
  name: (identifier) @function)


(method_declaration
  selector: (identifier) @function)

(method_declaration
  (keyword_selector
    (keyword_declarator
      keyword: (identifier) @function)))

(method_declaration
  (keyword_selector
    (keyword_declarator
      name: (identifier) @function)))

(message_expression
  receiver: (field_expression
    field: (field_identifier) @variable))

(method_definition
  selector: (identifier) @function)

(method_definition
  (keyword_selector
    (keyword_declarator
      keyword: (identifier) @function)))

(message_expression
  selector: (identifier) @function)

(method_definition
  (keyword_selector
    (keyword_declarator
      name: (identifier) @property)))

(message_expression
  selector: (keyword_argument_list
    (keyword_argument
      keyword: (identifier) @function)))

(message_expression
  selector: (keyword_argument_list
    (keyword_argument
      argument: (identifier) @property)))

(unary_expression argument: (identifier) @function)
(va_arg_expression) @function
(va_arg_expression va_list: (identifier) @property)
(enumerator name: (identifier) @property)


;; Parameters
(parameter_declaration
  declarator: (identifier) @variable.parameter)

(parameter_declaration
  declarator: (pointer_declarator) @variable.parameter)

(parameter_declaration
  declarator: (pointer_declarator
    declarator: (identifier) @variable.parameter))

(for_in_statement
  loop: (identifier) @variable.parameter)

(dictionary_expression
  key:(_expression) @property)
(dictionary_expression
  value: (_expression) @property)
(array_expression
  (identifier) @property)
(argument_list
  (identifier) @property)
(expression_statement
  (identifier) @property)

(_expression (identifier) @property)

[
  "__attribute"
  "__attribute__"
  "__cdecl"
  "__clrcall"
  "__stdcall"
  "__fastcall"
  "__thiscall"
  "__vectorcall"
  "_unaligned"
  "__unaligned"
  "__declspec"
] @attribute

(attribute_specifier) @attribute

((identifier) @constant
 (#match? @constant "^[A-Z][A-Z0-9_$]+$"))

(ERROR) @error