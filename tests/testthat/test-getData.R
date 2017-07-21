context("getData")

test_that("getData works with urls without header", {
  expect_equal(getData("http://httpbin.org/status/200"),"")
  expect_equal(getData("http://httpbin.org/status/404"),"check URL")
})

test_that("getData works with urls with header", {
  expect_equal(getData("http://httpbin.org/status/200",headers = '{"Key":"Value"}'),"")
  expect_equal(getData("http://httpbin.org/headers",headers = '{"Key":"Value"}'),list(headers=list(Accept="application/json, text/xml, application/xml, */*",`Accept-Encoding`="gzip, deflate",Connection="close",Host="httpbin.org",`User-Agent`="libcurl/7.53.1 r-curl/2.7 httr/1.2.1",Key="Value")))
  expect_equal(getData("http://httpbin.org/status/404",headers = '{"Key":"Value"}'),"check URL")
  expect_equal(getData("http://httpbin.org/status/200",headers = list(Key='Value')),"")
  expect_equal(getData("http://httpbin.org/headers",headers =list(Key="Value")),list(headers=list(Accept="application/json, text/xml, application/xml, */*",`Accept-Encoding`="gzip, deflate",Connection="close",Host="httpbin.org",`User-Agent`="libcurl/7.53.1 r-curl/2.7 httr/1.2.1",Key="Value")))
  expect_equal(getData("http://httpbin.org/status/404",headers = list(Key="Value")),"check URL")
})
