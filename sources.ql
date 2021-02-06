import javascript

predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode dollarFn | 
        jquery().getAPropertyRead("fn").getAPropertySource() = dollarFn
        and dollarFn.getLastParameter() = source
    )
}

from DataFlow::Node node
where isSource(node)
select node