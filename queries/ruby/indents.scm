[
  (class)
  (singleton_class)
  (method)
  (singleton_method)
  (module)
  (call)
  (if)
  (block)
  (do_block)
  (hash)
  (array)
  (argument_list)
  (case)
  (while)
  (until)
  (for)
  (begin)
  (unless)
  (assignment)
  (parenthesized_statements)
] @indent.begin

;; begin indent raw heredoc
(((heredoc_beginning) (heredoc_body)) @indent.begin
                   (#set! indent.immediate 1))

;; begin indent assignment heredoc
(((assignment) (heredoc_body)) @indent.begin
                   (#set! indent.immediate 1))

;; begin indent raw heredoc with method call
(((call) (heredoc_body)) @indent.begin
                   (#set! indent.immediate 1))

(heredoc_content) @indent.auto

[
  "end"
  ")"
  "}"
  "]"
  (heredoc_end)
] @indent.end

[
  "end"
  ")"
  "}"
  "]"
  (when)
  (elsif)
  (else)
  (rescue)
  (ensure)
] @indent.branch

(comment) @indent.ignore
