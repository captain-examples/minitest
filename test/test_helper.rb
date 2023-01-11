require "rwx"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  [
    Minitest::Reporters::DefaultReporter.new,
    Minitest::Reporters::JUnitReporter.new("tmp/reports", true, single_file: true)
  ]
)
