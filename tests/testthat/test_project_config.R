context("Check That Project Config Collection Works")

expected_output <- list(project_name = "",
                        dir_name = "",
                        project_description = "",
                        author = '',
                        selected_license = 'MIT',
                        git_status = 'Yes',
                        selected_ci = 'GitHub Actions')

# Non Interactive Nature of Tests Only Allow Us to Check items
# that use selected.list. The readline itmes return "" in non-interactive.
test_that("Config Returns Expected Results", {
          skip("Can't test this due to non-interactive")
          expect_equal(list, cookiecutteR:::project_config())
          })
