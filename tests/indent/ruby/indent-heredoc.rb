# raw heredoc
<<~EOF
  SELECT id
  FROM users
EOF


# assignment heredoc
_heredoc = <<~EOF
  SELECT id
  FROM users
EOF


# heredoc with method call
_heredoc = <<~EOF.tr("\n", " ").strip
  SELECT id
  FROM users
EOF


# raw heredoc with method call
<<~EOF.tr("\n", " ").strip
  SELECT id
  FROM users
EOF
