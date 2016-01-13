# http://www.quintuitive.com/2012/08/22/arma-models-for-trading/

library(quantmod)
library(fArma)

# Get S&P 500
getSymbols( "^GSPC", from="2000-01-01" )

getSymbols( "^BVSP", from="2000-01-01" )

# Compute the daily returns
gspcRets = diff( log( Cl( GSPC ) ) )

gspcRets = diff( log( Cl( BVSP ) ) )

# Use only the last two years of returns
gspcTail = as.ts( tail( gspcRets, 500 ) )

# Fit the model
gspcArma = armaFit( formula=~arma(2,2), data=gspcTail )


armaSearch = function(
  xx,  
  minOrder=c(0,0),
  maxOrder=c(5,5),
  trace=FALSE )
{
  bestAic = 1e9
  len = NROW( xx ) 
  for( p in minOrder[1]:maxOrder[1] ) for( q in minOrder[2]:maxOrder[2] )
  {
    if( p == 0 && q == 0 )
    {    
      next
    }    
    
    formula = as.formula( paste( sep="", "xx ~ arma(", p, ",", q, ")" ) )
    
    fit = tryCatch( armaFit( formula, data=xx ),
                    error=function( err ) FALSE,
                    warning=function( warn ) FALSE )
    if( !is.logical( fit ) )
    {    
      fitAic = fit@fit$aic
      if( fitAic < bestAic )
      {    
        bestAic = fitAic
        bestFit = fit
        bestModel = c( p, q )
      }    
      
      if( trace )
      {    
        ss = paste( sep="", "(", p, ",", q, "): AIC = ", fitAic )
        print( ss ) 
      }    
    }    
    else
    {    
      if( trace )
      {    
        ss = paste( sep="", "(", p, ",", q, "): None" )
        print( ss ) 
      }    
    }    
  }
  
  if( bestAic < 1e9 )
  {
    return( list( aic=bestAic, fit=bestFit, model=bestModel ) )
  }
  
  return( FALSE )
}

busca_mejor_arma = armaSearch(gspcRets)

head(busca_mejor_arma)

mejorModeloArma = armaFit( xx ~ arma(0, 1), data=gspcRets )
mejorModeloArma@fit$aic


# Fit the model
gspcArma = armaFit( formula=~arma(2,2), data=gspcTail )

ARMA1 <-armaFit(~ arma(1,3), data=gspcRets)
ARMA1


# predict


library( quantmod )
library( fArma )

getSymbols( "SPY", from="1900-01-01" )
spyRets = diff( log( Cl( SPY )["/2012-05-29"] ) )
spyArma = armaFit( ~arma(0, 2), data=as.ts( tail( spyRets, 500 ) ) )
as.numeric( predict( spyArma, n.ahead=1, doplot=F )$pred )
# -0.0004558926

# currentIndex is the index of the day we are making a forcast for
# xx is the return series
# history is look-back period to consider at each point


currentIndex = "2012-05-29"
xx = spyRets

repeat
{
  nextIndex = currentIndex + 1
  
  # lags is how many days behind is the data, the default is 1,
  # meaning use data up to yesterdays close
  forecastLength = nextIndex - currentIndex + lags - 1
  
  # Get the series
  yy = xx[index(xx)[(currentIndex-history-lags+1):(currentIndex-lags)]]
  
  # Find the best fit
  bestFit = armaSearch(
    yy,  
    minOrder,
    maxOrder,
    withForecast=TRUE,   # we want the model to have a valid forecast
    forecastLength=forecastLength,   # 1 for a dialy forecast
    trace=trace,
    cores=cores )   # the number of cores to use
  
  if( !is.null( bestFit ) )
  {
    # Forecast
    fore = tryCatch( predict( bestFit, n.ahead=forecastLength, doplot=FALSE ),
                     error=function( err ) FALSE,
                     warning=function( warn ) FALSE )
    if( !is.logical( fore ) )
    {    
      # Save the forecast
      forecasts[currentIndex] = tail( fore$pred, 1 )
      
      # Save the model order
      ars[currentIndex] = order[1]
      mas[currentIndex] = order[2]
      
      forecasts[currentIndex] = 0
    }
    
    if( nextIndex > len ) break
    currentIndex = nextIndex
  }
}

# https://gist.github.com/ivannp/2902636


library(quantmod)
library(fGarch)

getSymbols("SPY", from="1900-01-01")
spyRets = diff(log(Ad(SPY)))
spyGarch = garchFit(~arma(0, 2) + garch(1, 1), data=as.ts(tail(spyRets, 500)))
predict(spyGarch, n.ahead=1, doplot=F)
# the actual forecasts are predict(spyGarch, n.ahead=1, doplot=F)[,1]

# https://gist.github.com/ivannp/5198580



findBestArma = function(
  xx,  
  minOrder=c(0,0),
  maxOrder=c(5,5),
  trace=FALSE )
{
  bestAic = 1e9
  len = NROW( xx ) 
  for( p in minOrder[1]:maxOrder[1] ) for( q in minOrder[2]:maxOrder[2] )
  {
    if( p == 0 && q == 0 )
    {    
      next 
    }    
    
    formula = as.formula( paste( sep="", "xx ~ arma(", p, ",", q, ")" ) )
    
    fit = tryCatch( armaFit( formula, data=xx ), error=function( err ) FALSE, warning=function( warn ) FALSE )
    if( !is.logical( fit ) )
    {    
      fitAic = fit@fit$aic
      if( fitAic < bestAic )
      {    
        bestAic = fitAic
        bestFit = fit
        bestModel = c( p, q )
      }    
      
      if( trace )
      {    
        ss = paste( sep="", "(", p, ",", q, "): AIC = ", fitAic )
        print( ss ) 
      }    
    }    
    else 
    {    
      if( trace )
      {    
        ss = paste( sep="", "(", p, ",", q, "): None" )
        print( ss ) 
      }    
    }    
  }
  
  if( bestAic < 1e9 )
  {
    return( list( aic=bestAic, fit=bestFit, model=bestModel ) )
  }
  
  return( FALSE )
}


xxtest = findBestArma(gspcRets)

head(xxtest)

xxArma = armaFit( xx ~ arma(5, 5), data=gspcRets )
xxArma@fit$aic