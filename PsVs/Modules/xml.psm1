<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   <A detailed description of the script>
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>

function Get-XmlNsDoc {
	[CmdletBinding()]
	param (
	
		[parameter(Manadatory=$true,ValueFromPipeline=$true)]
		[string] $fileName,
		
		[parameter(Manadatory=$true,ValueFromPipeline=$true)]
		[string] $xmlNamespace
	)
	PROCESS {
	
		# Get $fileInfo from $fileName
		# Get $xmlDoc with namespace considered
	
		[System.Xml.XmlDocument] $xml = $csprojInfo.Xml
		$xmlNamespaceManager = New-Object -TypeName System.Xml.XmlNamespaceManager -ArgumentList $xml.NameTable
		$xmlNamespaceManager.AddNamespace("x",$msXmlns)
		
	}
}