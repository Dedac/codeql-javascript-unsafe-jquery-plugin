import javascript

from DataFlow::SourceNode dollarSource
where jquery().getAPropertyRead("fn").getAPropertySource() = dollarSource
select dollarSource