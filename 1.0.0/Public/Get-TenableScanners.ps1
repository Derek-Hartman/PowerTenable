<#
.Synopsis
    List Scanners

.EXAMPLE 
    Get-TenableScanners -AccessKey "Access Key" -SecretKey "Secret Key"

.NOTES
    Modified by: Derek Hartman
    Date: 8/21/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Get-TenableScanners {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Access Key.")]
        [string[]]$AccessKey,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Secret Key.")]
        [string[]]$SecretKey
    )

    $Uri = 'https://cloud.tenable.com/scanners'

    $Header = @{
        'X-ApiKeys' = "accessKey=$AccessKey;secretKey=$SecretKey"
        'Accept'    = 'application/json';
    }  

    $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Header
    Write-Output $Response.Scanners
}