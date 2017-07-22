#'@title getData
#'@description retrieves data from webpage and return a list if JSON format otherwise text data
#'@param url url of webpage to retrieve
#'@param headers list/json format input for custom headers
#'@param ... check \code{\link[httr]{GET}}
#'@keywords url
#'@keywords header
#'@import httr
#'@seealso \code{\link[httr]{GET}}\code{\link[url.Fetcher]{getData}}
#'@examples
#'getr("www.cnn.com")
#'getr("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers='{"Customheader":"CS"}')
#'getr("http://echo.jsontest.com/fieldkey/fieldvalue/purpose/test",headers=list(Customheader="CS"))

getr<-function(url,...,headers=NULL)
{if(!httr::http_error(url)){
  d<-GET(url,...)
  tryCatch(
    {
      ifelse(grepl('json',httr::headers(d)$'content-type'),data<-httr::content(d),data<-httr::content(d,as='text'))
      if (!is.null(headers)) {
        ifelse(typeof(headers)=="list",header<-headers,header<-jsonlite::fromJSON(headers))
        if(grepl('json',httr::headers(d)$'content-type')){
          data$headers[names(header)]=header[names(header)]
        }
      }
    }, error=function(e){
      print(e)
    }
  )
} else{
  data<-"check URL and try again"
}
  return(data)
}
