<#
.Synopsis
    Gets a specific agent

.EXAMPLE 
    Get-TenableAgent -AccessKey "Access Key" -SecretKey "Secret Key" -ScannerID "201504" -Hostname "PF13GZQA"

.NOTES
    Modified by: Derek Hartman
    Date: 8/21/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Get-TenableAgent {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Access Key.")]
        [string[]]$AccessKey,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Secret Key.")]
        [string[]]$SecretKey,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Scanner ID.")]
        [string[]]$ScannerID,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Hostname.")]
        [string[]]$Hostname
    )

    $Uri = "https://cloud.tenable.com/scanners/$ScannerID/agents?w=$Hostname"

    $Header = @{
        'X-ApiKeys' = "accessKey=$AccessKey;secretKey=$SecretKey"
        'Accept'    = 'application/json';
    }  

    $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Header
    Write-Output $Response.agents
}