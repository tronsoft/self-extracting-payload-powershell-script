<#
  .SYNOPSIS
  Extracts a payload from a self extractor.

  .DESCRIPTION
  Extracts a payload from a self extractor.

  .PARAMETER Path
  Specifies the path to the payload file.

  .INPUTS
  None. You cannot pipe objects to Extract-Payload.ps1.

  .OUTPUTS
  A extracted file.

  .EXAMPLE
  C:\PS> .\BExtract-Payload.ps1 -Path c:\script.ps1 -PayloadPath c:\payload.bin
#>

param ([string]$Path)

Write-Host 'Extracting payload'

$content = Get-Content $PSCommandPath

$totalLines = ($content | Measure-Object -Line).Lines
$lineNumber = ($content | Select-String -Pattern "^#--content--").LineNumber
$tail = $totalLines - $lineNumber

$base64string = Get-Content $PSCommandPath -tail $tail 
[Convert]::FromBase64String($base64string)  | Set-Content -NoNewLine $PayloadPath -Encoding Byte

Write-Host 'Extracted payload'

exit 0