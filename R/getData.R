#'@title getData
#'@description retrieves data from webpage and use caching mechanism to retrieve data from cache if run more than once
#'@param url url of webpage to retrieve
#'@param headers list/json format input for custom headers
#'@param ... check \code{\link[httr]{GET}}
#'@param cached returns a updated result if cached = FALSE
#'@keywords url
#'@keywords headers
#'@export
#'@include getr.R
#'@seealso \code{\link[httr]{GET}}
#'@examples
#'getData("www.cnn.com")
#'getData("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers='{"Customheader":"CS"}')
#'getData("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers=list(Customheader="CS"))
#'getData("www.cnn.com",cached=FALSE)



getData<-function(url,...,headers=NULL,cached=TRUE){
  if(cached){
  d<-R.cache::addMemoization(getr)
  data<-d(url,...,headers=headers)
  }else{
    data<-getr(url,...,headers=headers)
  }
return(data)
}
