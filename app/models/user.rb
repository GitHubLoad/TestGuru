class User < ApplicationRecord
  def user_tests(level)
    Test.joins('JOIN test_users ON tests.id = test_users.test_id')
        .where(tests: { level: level })
  end
end