test_that("Erro se não for pdf", {
  expect_error(get_pdf(2))
})
