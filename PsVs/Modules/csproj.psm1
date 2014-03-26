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

function Get-CsprojXmlDocNamespace {
	return "http://schemas.microsoft.com/developer/msbuild/2003"
}
<#
function Remove-CsprojReferenceVersionInfo{
    [cmdletbinding()]
    param(
        [parameter(Mandatory=$true, Position=1)]
        [string] $dir
        ,
        [Parameter(Mandatory=$false)]
        [switch] $recurse = $false
    )
#>

function Get-CsprojXmlDoc {
	[CmdletBinding()]
	param (	
		[parameter(Mandatory=$true,ValueFromPipeline=$true)]
		[string] $fileName
	)
	PROCESS {
	
		# [System.IO.FileInfo] $fileInfo = Get-Item $fileName 
		[System.Xml.XmlDocument] $xmlDoc = Get-Content $fileName		
		
		[System.Xml.XmlNamespaceManager] $xmlNamespaceManager = New-Object -TypeName System.Xml.XmlNamespaceManager -ArgumentList $xmlDoc.NameTable		
		$xmlNamespaceManager.AddNamespace( "x", $(Get-CsprojXmlDocNamespace) )
		
		return ,$xmlDoc
	}
}

function Get-CsprojXmlDocNode {
	[CmdletBinding()]
	param (	
		[parameter(Mandatory=$true,ValueFromPipeline=$true)]
		[System.Xml.XmlDocument] $xmlDoc,
		
		[string] $nodeName
	)
	PROCESS {
	}
}

function Get-CsprojObject {
	param (	
		[parameter(Mandatory=$true,ValueFromPipeline=$true)]
		[string] $fileName
	)
	PROCESS {
	
        $obj = @{}
        $obj.FileInfo = { Get-Item $fileName }
        $obj.XmlDoc = { Get-CsprojXmlDoc $fileName }
		$obj.Global = @{}
		$obj.Global.PropertyGroup
	}
}