param (
    $DebugPreference = "Continue",
    $ErrorActionPreference = "Stop",
    $xsltFile = "config/gpo.xsl",
    $xmlFileOne = "xmlfiles/nbrow018-dev.xml",
    $xmlFileTwo = "xmlfiles/nbrow018-dev.xml",
    $outputExcelfile = "outFiles/comare.xlsx",
    $outputCSVFile = "outFiles/xmlFileOne.csv"
)



$env:executionPath = (pwd).Path
Set-Location -Path $env:executionPath 

Write-Debug "Execution Path is : $env:executionPath "

. "./scripts/loadlib.ps1"


$xslt = New-Object System.Xml.Xsl.XslCompiledTransform;

$tempFolder = $(New-Item -Path "$env:executionPath/temp" -ItemType Directory -Force)
$xslt.load( "$env:executionPath/config/removenamespace.xsl" )
$xslt.Transform( "$env:executionPath/$xmlFileOne", "$tempFolder/interim.xml" )

$xslt.load( "$env:executionPath/$xsltFile" )
$xslt.Transform( "$tempFolder/interim.xml", "$env:executionPath/$outputCSVFile" )