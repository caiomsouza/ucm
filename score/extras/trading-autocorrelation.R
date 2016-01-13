
# Trading Autocorrelation?
# http://www.quintuitive.com/2015/11/15/trading-autocorrelation/

#install.packages("quantmod")
require(quantmod)
spy=getSymbols("SPY",from="1900-01-01",auto.assign=F)
# Note: We use adjusted close - it's unrealistic to expect anything from actual close in the
# presence of dividends
spy.rets = ROC(Ad(spy),na.pad=F)
aa = acf(tail(spy.rets,500),main="ACF computed over the last 500 days")
head(aa)
# [1]  1.000000000  0.051116484 -0.037469705 -0.010014871 -0.126667484 -0.004113005

high.acf = function(xx,conf.level=0.95,lag=1) {
  aa = acf(xx,plot=F)
  conf = qnorm((1 + conf.level)/2)/sqrt(sum(!is.na(xx)))
  if(abs(aa$acf[lag+1,1,1]) > conf) sign(aa$acf[lag+1,1,1]) else 0
}

backtest.acf = function(rets, n=21, conf.level=0.95, lag=1, fade=F, dates="2004/2013") {
  aa = na.trim(rollapplyr(rets, width=n+lag, FUN=high.acf, conf.level=conf.level, lag=lag))
  bb = merge(rets, aa, all=F)
  ind = sign(bb[,1]*bb[,2])
  if(fade) ind = -ind
  cc = merge(rets, lag.xts(ind), all=F)
  dd = cc[,1]*cc[,2]
  strat = dd[dates]
  n.win = NROW(which(as.numeric(strat) > 0, arr.ind=T))
  n.trades = NROW(which(as.numeric(strat) != 0, arr.ind=T))
  str = paste(round(n.win/n.trades*100,2), "% [", n.win, "/", n.trades, "]", sep="")
  print(str)
}

# About 3 (trading) months of history
backtest.acf(spy.rets, dates="2004/2013", fade=T, n=63)
# [1] "54.88% [45/82]"