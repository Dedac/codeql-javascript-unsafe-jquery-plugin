import javascript

from DataFlow::PropRead dollarArg
where jquery().getAPropertyRead("fn") = dollarArg
select dollarArg 