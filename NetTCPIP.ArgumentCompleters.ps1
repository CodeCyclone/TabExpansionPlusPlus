## NetTCPIP module Custom Completers ##

#
# .SYNOPSIS
#
#    Complete the -InterfaceAlias,ifAlias arguments to NetTCPIP module cmdlets
#
function NetIPAddressInterfaceAliasParameterCompleter
{
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)

    NetTCPIP\Get-NetIPAddress -InterfaceAlias "$wordToComplete*" | Sort-Object InterfaceAlias | ForEach-Object {
        New-CompletionResult $_.InterfaceAlias $_.InterfaceAlias
    }
}


Register-ArgumentCompleter `
    -Command ( Get-CommandWithParameter -Module NetTCPIP -ParameterName InterfaceAlias) `
    -Parameter 'InterfaceAlias' `
    -Description 'Complete InterfaceAlias names, for example: Get-NetIPAddress -InterfaceAlias <TAB>' `
    -ScriptBlock $function:NetIPAddressInterfaceAliasParameterCompleter


Register-ArgumentCompleter `
    -Command ( Get-CommandWithParameter -Module NetTCPIP -ParameterName ifAlias) `
    -Parameter 'ifAlias' `
    -Description 'Complete ifAlias names, for example: Get-NetIPAddress -ifAlias <TAB>' `
    -ScriptBlock $function:NetIPAddressInterfaceAliasParameterCompleter
