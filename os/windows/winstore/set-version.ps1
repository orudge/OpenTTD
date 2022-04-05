[CmdletBinding()]
[Alias()]
Param
(
    # EXE path
    [Parameter(Mandatory=$true, Position=0)]
    $ExePath
)

try
{
    $versionInfo = (Get-Item "$ExePath").VersionInfo
    $AppVersion = "$($versionInfo.FileMajorPart).$($versionInfo.FileMinorPart).$($versionInfo.FileBuildPart).$($versionInfo.FilePrivatePart)"

    Write-Output "SET OTTD_VERSION=$($AppVersion)"
}
catch
{
	Write-Output "@ECHO Error retrieving EXE version - did you provide a path?"
    exit 1
}
