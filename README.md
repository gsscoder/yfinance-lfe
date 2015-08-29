# yfinance-lfe

Port of F# library [YFinance.fs](https://github.com/gsscoder/YFinance.fs).

## Introduction

LFE library for querying real time stock market data including indexes such as NASDAQ and the S&P500.

## Installation

Just add it to your ``rebar.config`` deps:

```erlang
  {deps, [
    ...
    {yfinance-lfe, ".*",
      {git, "git@github.com:YOURNAME/yfinance-lfe.git", "master"}}
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
> (ljson:print (yfinance-lfe:get-stock-quotes `("GOOGL" "YHOO")))
[{<<"quote">>,
  [[{<<"symbol">>,<<"YHOO">>},
    {<<"AverageDailyVolume">>,<<"12826300">>},
    {<<"Change">>,<<"-0.55">>},
    {<<"DaysLow">>,<<"32.93">>},
    {<<"DaysHigh">>,<<"33.57">>},
    {<<"YearLow">>,<<"29.00">>},
    {<<"YearHigh">>,<<"52.62">>},
    {<<"MarketCapitalization">>,<<"31.20B">>},
    {<<"LastTradePriceOnly">>,<<"33.14">>},
    {<<"DaysRange">>,<<"32.93 - 33.57">>},
    {<<"Name">>,<<"Yahoo! Inc.">>},
    {<<"Symbol">>,<<"YHOO">>},
    {<<"Volume">>,<<"9366075">>},
    {<<"StockExchange">>,<<"NMS">>}],
   [{<<"symbol">>,<<"GOOGL">>},
    {<<"AverageDailyVolume">>,<<"2450570">>},
    {<<"Change">>,<<"-8.27">>},
    {<<"DaysLow">>,<<"653.75">>},
    {<<"DaysHigh">>,<<"667.00">>},
    {<<"YearLow">>,<<"490.91">>},
    {<<"YearHigh">>,<<"713.33">>},
    {<<"MarketCapitalization">>,<<"452.24B">>},
    {<<"LastTradePriceOnly">>,<<"659.69">>},
    {<<"DaysRange">>,<<"653.75 - 667.00">>},
    {<<"Name">>,<<"Google Inc.">>},
    {<<"Symbol">>,<<"GOOGL">>},
    {<<"Volume">>,<<"1941833">>},
    {<<"StockExchange">>,<<"NMS">>}]]}]
ok
> (ljson:print (yfinance-lfe:get-stock-quotes `("MSFT")))
[{<<"quote">>,
  [{<<"symbol">>,<<"MSFT">>},
   {<<"AverageDailyVolume">>,<<"33364400">>},
   {<<"Change">>,<<"+0.03">>},
   {<<"DaysLow">>,<<"43.39">>},
   {<<"DaysHigh">>,<<"44.15">>},
   {<<"YearLow">>,<<"39.72">>},
   {<<"YearHigh">>,<<"50.05">>},
   {<<"MarketCapitalization">>,<<"351.35B">>},
   {<<"LastTradePriceOnly">>,<<"43.93">>},
   {<<"DaysRange">>,<<"43.39 - 44.15">>},
   {<<"Name">>,<<"Microsoft Corporation">>},
   {<<"Symbol">>,<<"MSFT">>},
   {<<"Volume">>,<<"28246725">>},
   {<<"StockExchange">>,<<"NMS">>}]}]
ok
```