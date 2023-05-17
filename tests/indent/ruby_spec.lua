local Runner = require("tests.indent.common").Runner

local run = Runner:new(it, "tests/indent/ruby", {
  shiftwidth = 2,
  expandtab = true,
})

describe("indent Ruby:", function()
  describe("whole file:", function()
    run:whole_file(".", {
      expected_failures = { "./period-issue-3364.rb" },
    })
  end)

  describe("new line:", function()
    run:new_line("indent-unless.rb", { on_line = 1, text = "stmt", indent = 2 })
    run:new_line("indent-assignment.rb", { on_line = 1, text = "1 +", indent = 2 })
    run:new_line("indent-parenthesized-statements.rb", { on_line = 1, text = "stmt", indent = 2 })
    run:new_line("indent-rescue.rb", { on_line = 1, text = "rescue", indent = 0 })
    run:new_line("indent-ensure.rb", { on_line = 1, text = "ensure", indent = 0 })

    -- heredoc testing
    run:new_line("indent-heredoc.rb", { on_line = 2, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 3, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 5, text = "stmt", indent = 0 })

    run:new_line("indent-heredoc.rb", { on_line = 9, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 10, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 12, text = "stmt", indent = 0 })

    run:new_line("indent-heredoc.rb", { on_line = 16, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 17, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 19, text = "stmt", indent = 0 })

    run:new_line("indent-heredoc.rb", { on_line = 23, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 24, text = "stmt", indent = 2 })
    run:new_line("indent-heredoc.rb", { on_line = 26, text = "stmt", indent = 0 })
  end)
end)
