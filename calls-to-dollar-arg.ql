import javascript


from CallExpr dollarCall, Expr dollarArg
where dollarCall.getCalleeName() = "$"
and dollarCall.getArgument(0) = dollarArg
select dollarCall