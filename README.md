# yfinance-lfe

Port of F# library [YFinance.fs](https://github.com/gsscoder/YFinance.fs),
originally ported from [yfinance](https://github.com/owainlewis/yfinance) by @owainlewis.

## Introduction

LFE library for querying real time stock market data including indexes such as NASDAQ and the S&P500.

## Installation

Just add it to your ``rebar.config`` deps:

```erlang
  {deps, [
    ...
    {yfinance-lfe, ".*",
      {git, "git@github.com:gsscoder/yfinance-lfe.git", "master"}}
      ]}.
```

And then do the usual:

```bash
    $ rebar get-deps
    $ rebar compile
```

## Usage
```cl
Starting an LFE REPL ...
Erlang/OTP 17 [erts-6.4] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

LFE Shell V6.4 (abort with ^G)
> (yfinance-lfe:start)
(#(inets ok) #(ssl ok) #(lhttpc ok) #(lhc ok) #(yfinance-lfe ok))
> (yfinance-lfe:get-stock-quotes `("ORCL" "GOOGL"))
(#(stock-quote
   "Google Inc."
   "GOOGL"
   "644.91"
   "+15.35"
   "645.06"
   "630.64"
   "713.33"
   "490.91")
 #(stock-quote
   "Oracle Corporation Common Stock"
   "ORCL"
   "36.75"
   "+0.74"
   "36.75"
   "36.11"
   "46.71"
   "35.14"))
> (yfinance-lfe:get-stock-quotes `("MSFT"))
(#(stock-quote
   "Microsoft Corporation"
   "MSFT"
   "43.36"
   "+1.54"
   "43.38"
   "41.88"
   "50.05"
   "39.72"))
```