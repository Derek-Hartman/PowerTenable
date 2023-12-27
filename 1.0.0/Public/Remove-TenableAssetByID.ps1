<#
.Synopsis
    Deletes specific asset

.EXAMPLE
    Remove-TenableAssetByID -AccessKey "Access Key" -SecretKey "Secret Key" -TenableAssetID "ID"

.NOTES
    Modified by: Derek Hartman
    Date: 9/8/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Remove-TenableAssetByID {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Companies URL.")]
        [string[]]$AccessKey,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Shopify Token.")]
        [string[]]$SecretKey,

        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Shopify Token.")]
        [string[]]$TenableAssetID
    )

    $Uri = "https://cloud.tenable.com/workbenches/assets/$TenableAssetID"

    $Header = @{
        'X-ApiKeys'    = "accessKey=$AccessKey;secretKey=$SecretKey"
        'Accept'       = 'application/json';
        'content-type' = 'application/json';
    }  

    $Response = Invoke-RestMethod -Method Delete -Uri $Uri -Headers $Header
}