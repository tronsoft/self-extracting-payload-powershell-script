<#
  .SYNOPSIS
  Build a self extractor.

  .DESCRIPTION
  Build a self extractor.

  .PARAMETER ExtractingScriptPath
  Specifies the path to the payload file.

  .PARAMETER PayloadPath
  Specifies the path to the payload file.

  .PARAMETER ExtractorPath
  Specifies the path of the extractor file.

  .INPUTS
  None. You cannot pipe objects to build-self-extractor.ps1.

  .OUTPUTS
  A extractor file.

  .EXAMPLE
  C:\PS> .\Build-Self-Extractor.ps1 -ExtractingScriptPath c:\script.ps1 -PayloadPath c:\payload.bin -ExtractorPath c:\temp\extractor.ps1
#>

param ([string]$ExtractingScriptPath, [string]$PayloadPath, [string]$ExtractorPath)

Get-Content $ExtractingScriptPath | Set-Content $ExtractorPath

$payload = [Convert]::ToBase64String((Get-Content -Raw $PayloadPath -Encoding Byte))
$payload | Add-Content -NoNewline $ExtractorPath