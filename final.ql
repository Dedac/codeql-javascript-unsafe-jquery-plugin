/**
* @name Cross-site scripting vulnerable plugin
* @kind path-problem
* @id js/xss-unsafe-plugin
*/

import javascript
import DataFlow::PathGraph

class Configuration extends TaintTracking::Configuration {
  Configuration() { this = "XssUnsafeJQueryPlugin" }

  override predicate isSource(DataFlow::Node source) {
    exists(DataFlow::FunctionNode dollarFn | 
        jquery().getAPropertyRead("fn").getAPropertySource() = dollarFn
        and dollarFn.getLastParameter() = source
    )
}

  override predicate isSink(DataFlow::Node sink) {
      sink = jquery().getACall().getArgument(0) 
  }
}

from Configuration cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)

select sink, source, sink, "Potential XSS vulnerability in plugin."