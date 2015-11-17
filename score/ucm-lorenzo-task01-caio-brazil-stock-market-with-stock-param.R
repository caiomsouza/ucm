# UCM
# Prof. Lorenzo Escot
# Alumno: Caio Fernandes Moreno (caiofern@ucm.es)
# Brazil Stock Market Analysis




setwd("~/git/Bitbucket/ucm/SCORE/tareas/Lorenzo-Escot")

library(tseries) # adf.test, kpss.test, bds.test, get.hist.quote, portfolio.optim, surrogate, arma, garch
#install.packages("forecast")
library(forecast)
# En el paquete forecast tiene un modelo auto ARIMA.
#install.packages("fArma")
library(fArma) #ARMAFIT, RSFIT
#install.packages("fGarch")
library(fGarch) #GARCHFIT formula ~arma (2,1) + garch (1,1) # ~ AltGr + 4
#install.packages("outliers")
library(outliers) #: outlier, rm.outlier, scores, chisq.out.test # para detectar outliers o datos an?malos ojo serie estacionaria
#install.packages("zoo")
library(zoo)
#setinternet2() #esto abre el puerto de internet



#stock.name <- "^BVSP"
#stock.description <- "IBOVESPA"



generateAnalysis <- function(x, y) {
  
  
  stock.name <- x 
  stock.description <- y  
  
  
  ## lectura de los datos hist?ricos del ^BVSP
  stock.name <- get.hist.quote(instrument=stock.name, quote="AdjClose")
  
  # BVSP time series starts 1993-04-27
  # http://finance.yahoo.com/q?s=%5EBVSP
  
  series.name <- stock.name
  
  str(series.name)
  summary(series.name)
  start(series.name)
  end(series.name)
  plot(series.name)
  
  head(series.name, 10)
  
  tail(series.name, 10)
  
  # Mirando los datos he decidido con la ayuda del Prof. Lorenzo no quitar los datos de 1993 hasta 1998.
  
  #?existen datos nulos?
  length(series.name)
  length(series.name[!is.na(series.name)])
  length(complete.cases(series.name))
  #parece que no, pero si tuviera na se podr?an quitar con: ibex<-ibex[complete.cases(ibex)]
  
  series.name<-series.name[complete.cases(series.name)]
  plot(series.name)
  
  
  ### podemos seleccionar una submuestra: Temporal
  series.name.short <-window(series.name,start=as.Date("1993-04-27"),end=as.Date("2015-09-30"))
  str(series.name.short)
  summary(series.name.short)
  plot(series.name.short)
  
  
  ## Calculo la serie de rendimientos
  d.series.name <- diff(log(series.name.short))
  
  # Concatenate stock.description with the text Withall
  plot.description <- paste(stock.description, "WITH ALL DATA", collapse = ", ")
  
  #Grafico de la serie 
  plot(d.series.name, main=(plot.description))
  
  
  
  
  
  #Datos an?malos
  # type = z Busca los datos tipificados mayor que 5 vezes la sd (disviacion tipica)
  
  # Remove datos anomalos
  remove.outlier.d.series.name <- d.series.name[abs(scores(d.series.name, type="z"))<=5]
  
  #plot(remove.outlier.d.series.name, main="IBOVESPA WITHOUT OUTLIERS")
  
  # Concatenate stock.description with the text Withall
  plot.description <- paste(stock.description, " WITHOUT OUTLIERS", collapse = ", ")
  
  #Grafico de la serie 
  plot(d.series.name, main=(plot.description))
  
  
  #?es estacionario?
  adf.test(d.series.name)# Ho: una ra?z unitaria (no estacionaria)
  
  # Augmented Dickey-Fuller Test
  # data:  dBVSP
  # Dickey-Fuller = -14.073, Lag order = 17, p-value = 0.01
  # alternative hypothesis: stationary
  
  # No es estacionaria
  
  sd(d.series.name) #desviaci?n t?pica
  
  # Statistical stationarity:
  # http://people.duke.edu/~rnau/411diff.htm
  
  
  #?presenta correlaci?n?
  
  df.d.series.name <- as.data.frame(d.series.name)
  
  #periodograma
  par(mfrow=c(2,1))
  acf(df.d.series.name, ylim=c(-1,1)) 
  pacf(df.d.series.name, ylim=c(-1,1))
  
  
  tsdisplay(df.d.series.name)
  
  
  # test bds
  bds.test(d.series.name,m=10) # H0: i.i.d
  
  #test R/, exponente de Hurst
  HURST<-rsFit(d.series.name, doplot = T)# Exponente de Hurst 0.5 ruido blanco
  HURST
  
  ##Se puede hacer el test de Hurst=0.5 con el siguiente estad?stico t ## 
  
  t<-(HURST@hurst$diag[2,1]-0.5)/HURST@hurst$diag[2,2]
  t
  
  #Modelo Auto Arima
  
  modelo.auto.arima <- auto.arima(d.series.name)
  plot(forecast(modelo.auto.arima,h=20))
  
  
  modelo.auto.arima1 <- auto.arima(d.series.name)
  plot(forecast(modelo.auto.arima1, h=1))
  
  
  # alternativa
  d.series.name.ARMA<-armaFit(~ arma(1,3), data=d.series.name)
  summary(d.series.name.ARMA, wich="all")
  residuo<-residuals(d.series.name.ARMA)
  
  
  plot(residuo)
  lines(residuo)
  
  df.residuo <- as.data.frame(residuo)
  
  #periodograma
  par(mfrow=c(2,1))
  acf(df.residuo, ylim=c(-1,1)) 
  pacf(df.residuo, ylim=c(-1,1))
  
  #x11()
  tsdisplay(df.residuo)
  
  
  # test bds
  bds.test(d.series.name,m=10) # H0: i.i.d
  
  #test R/, exponente de Hurst
  HURST<-rsFit(d.series.name, doplot = T)# Exponente de Hurst 0.5 ruido blanco
  HURST
  
  
  # Este codigo ha tenido muchas modificaciones hay que cojer el codigo del profesor Lorenzo.
  
  ##Se puede hacer el test de Hurst=0.5 con el siguiente estad?stico t ## 
  
  t<-(HURST@hurst$diag[2,1]-0.5)/HURST@hurst$diag[2,2]
  t
  
  
  ####PREDICCIONES
  predict(d.series.name.ARMA, n.ahead=10, conf=c(90,95), dplot=True)
  
  
  #alternativo
  d.series.name.ARMAGARCH<-garchFit(~ arma(1,1) + garch(2,1), data=d.series.name, include.mean=TRUE) ####aqu? el orden es GARCH,ARCH
  summary(d.series.name.ARMAGARCH)
  plot(d.series.name.ARMAGARCH@residuals)
  residuogarch<-residuals(d.series.name.ARMAGARCH)
  volatilitygarch<-volatility(d.series.name.ARMAGARCH)
  plot(volatilitygarch)
  lines(volatilitygarch)
  plot(d.series.name^2)
  
  predict(d.series.name.ARMAGARCH, n.ahead=10, conf=c(90,95), dplot=TRUE)
  
  
}



# IBOVESPA
stock.name <- "^BVSP"
stock.description <- "IBOVESPA"
# Call your function and pass x and y to the function
run <- generateAnalysis(stock.name,stock.description)


# Itau
stock.name <- "ITSA4.SA"
stock.description <- "Itausa - Investimentos Itau S.A"
# Call your function and pass x and y to the function
run <- generateAnalysis(stock.name,stock.description)


# BBAS3.SA
stock.name <- "BBAS3.SA"
stock.description <- "Banco do Brasil S.A."
# Call your function and pass x and y to the function
run <- generateAnalysis(stock.name,stock.description)


# KROT3.SA
stock.name <- "KROT3.SA"
stock.description <- "Kroton Educacional S.A."
# Call your function and pass x and y to the function
run <- generateAnalysis(stock.name,stock.description)

# VALE5.SA
stock.name <- "VALE5.SA"
stock.description <- "Vale S.A."
# Call your function and pass x and y to the function
run <- generateAnalysis(stock.name,stock.description)