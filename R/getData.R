#'@title getData
#'@description retrieves data from webpage and use caching mechanism to retrieve data from cache if run more than once
#'@param url url of webpage to retrieve
#'@param headers list/json format input for custom headers
#'@param ... check \code{\link[httr]{GET}}
#'@keywords url
#'@keywords header
#'@export
#'@seealso \code{\link[httr]{GET}}
#'@examples \dontrun{}
#'getData("www.cnn.com")
#'getData("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers='{"Customheader":"CS"}')
#'getData("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers=list(Customheader="CS"))

getData<-function(url,...,headers=NULL){
  d<-R.cache::addMemoization(getr)
return(d(url,...,headers=headers))
}
