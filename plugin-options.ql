import javascript

from DataFlow::FunctionNode dollarFn
where jquery().getAPropertyRead("fn").getAPropertySource() = dollarFn
select dollarFn, dollarFn.getLastParameter()