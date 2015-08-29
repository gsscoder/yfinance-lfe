(defmodule yfinance-lfe-util
  (export all))

(defun get-version ()
  (lutil:get-app-version 'yfinance-lfe))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(yfinance-lfe ,(get-version)))))
