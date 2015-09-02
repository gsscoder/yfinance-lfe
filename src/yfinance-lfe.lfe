(defmodule yfinance-lfe
  (export all))

(include-lib "clj/include/seq.lfe")
(include-lib "clj/include/compose.lfe")
(include-lib "include/data-types.lfe")

;;; API functions

(defun start ()
  (++ (lhc:start) `(#(yfinance-lfe ok))))

(defun generate-yql-query (xs)
  (case xs
    (`() "")
    (_ (++
	(->> xs
	     (lists:map (lambda (x) (++ "\"" x "\"")))
	     (reduce (lambda (x acc) (++ x "," acc)))
	     (++ "select * from yahoo.finance.quote where symbol in ("))
	")"))))

(defun query-item (name value)
  (++ name "=" (http_uri:encode value)))

(defun run-request (yql)
  (lhc:get (++ "https://query.yahooapis.com/v1/public/yql?"
	       (query-item "q" yql) "&"
	       (query-item "env" "store://datatables.org/alltableswithkeys") "&"
	       (query-item "format" "json"))))

(defun parse-response (json)
  (->> json
       (ljson:decode)
       (element 2)
       (ljson:get `(#b("results")))))

(defun get-stock-quotes (xs)
  "Fetch stock quotes from Yahoo Finance eg. get-stock-quotes `(""MSFT"" ""ORCL"")."
  (case xs
    (`() `())
    (_ (->> xs
	    (generate-yql-query)
	    (run-request)
	    (parse-response)))))
