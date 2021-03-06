#!/usr/bin/env pwsh
[CmdletBinding()]
Param(
  [Parameter(Mandatory = $True)]
  [String]
  $Name
)

<#
If using PowerShell 3.0, you will need to add an import statement here:
Import-Module BoltPwshHelper
#>
​
<#
Handle unhandled exceptions using the `trap` keyword
#>
trap {
  Write-BoltError -Message "Generic trap handler" -Exception $_
}

<#
An example of a custom error message based on a specific use case
#>
if ($name -eq 'Robert') {
  Write-BoltError -Message "User ${name} not allowed"
}
else {
  # TODO
}

<#
An example of returning a full exception stacktrace in Bolt formatted as json
You can add a `-Message` if you want
#>
try {
  $output = Invoke-PotentiallyFailingCommand -Command 'foo' -User $name
}
catch {
  Write-BoltError -Exception $_
}
