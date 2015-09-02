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

(defun get-field (field json)
  (erlang:binary_to_list
   (element 2
	    (lists:nth 1
		       (lists:filter (lambda (y) (== (element 1 y) field)) json)))))

(defun parse-quote (json)
  (make-stock-quote
    name (get-field #b("Name") json)
    symbol (get-field #b("Symbol") json)
    price (get-field #b("LastTradePriceOnly") json)
    change (get-field #b("Change") json)
    dayHigh (get-field #b("DaysHigh") json)
    dayLow (get-field #b("DaysLow") json)
    yearHigh (get-field #b("YearHigh") json)
    yearLow (get-field #b("YearLow") json)))
    
(defun parse-quotes (json)
  (lists:map (
	      lambda(x) (parse-quote x)) (ljson:get `(#b("quote")) json)))

(defun parse-response (json)
  (->> json
       (ljson:decode)
       (element 2)
       (ljson:get `(#b("results")))
       (parse-quotes)))

(defun get-stock-quotes (xs)
  "Fetch stock quotes from Yahoo Finance eg. get-stock-quotes `(""MSFT"" ""ORCL"")."
  (case xs
    (`() `())
    (_ (->> xs
	    (generate-yql-query)
	    (run-request)
	    (parse-response)))))
