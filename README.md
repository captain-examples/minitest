# Getting Captain working with minitest

1. 🧪 Ensure minitest produces JSON output

By default, minitest does not include reporters that produce enough detail for Captain. We recommend
installing the [minitest-reporters](https://github.com/minitest-reporters/minitest-reporters) gem and using it to
produce JUnit output.

```sh
gem install minitest-reporters
```

```ruby
# test_helper.rb
require "minitest/reporters"

Minitest::Reporters.use!(
  [
    Minitest::Reporters::DefaultReporter.new,
    Minitest::Reporters::JUnitReporter.new("tmp/reports", true, single_file: true)
  ]
)
```

2. 🔐 Create an Access Token

Create an Access Token for your organization within [Captain][captain] ([more documentation here][create-access-token]).

Add the new token as an action secret to your repository. Conventionally, we call this secret `RWX_ACCESS_TOKEN`.

3. 💌 Install the Captain CLI, and then call it when running tests

See the [full documentation on test suite integration][test-suite-integration].

```yaml
  - run: |
      captain run --suite-id captain-examples-minitest --test-results "tmp/*.xml" -- \
        bundle exec rake
    env:
      RWX_ACCESS_TOKEN: ${{ secrets.RWX_ACCESS_TOKEN }}
```

4. 🎉 See your test results in Captain!

Take a look at the [final workflow!][workflow-with-captain]

[captain]: https://account.rwx.com/deep_link/manage/access_tokens
[create-access-token]: https://www.rwx.com/docs/access-tokens
[workflow-with-captain]: https://github.com/captain-examples/minitest/blob/main/.github/workflows/ci.yml
[test-suite-integration]: https://www.rwx.com/captain/docs/test-suite-integration
