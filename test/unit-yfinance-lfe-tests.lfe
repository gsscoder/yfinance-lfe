(defmodule unit-yfinance-lfe-tests
  (behaviour ltest-unit)
  (export all)
  (import
    (from ltest
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest generate-yql-query
  (is-equal "" (yfinance-lfe:generate-yql-query `()))
  (is-equal "select * from yahoo.finance.quote where symbol in (\"ORCL\")" (yfinance-lfe:generate-yql-query `("ORCL")))
  (is-equal "select * from yahoo.finance.quote where symbol in (\"GOOGL\",\"ORCL\")" (yfinance-lfe:generate-yql-query `("ORCL" "GOOGL")))
  )
