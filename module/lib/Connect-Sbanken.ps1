function Connect-Sbanken {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]
        $UserId,
        [Parameter(Mandatory = $true, Position = 1)]
        [string]
        $ClientId,
        [Parameter(Mandatory = $true, Position = 2)]
        [string]
        $ClientSecret
    )
    $encodedClientId = [System.Web.HttpUtility]::UrlEncode($clientId) 
    $encodedSecret = [System.Web.HttpUtility]::UrlEncode($secret) 

    $credentials = "$($encodedClientId):$($encodedSecret)"

    $Bytes = [System.Text.Encoding]::UTF8.GetBytes($credentials)
    $EncodedText =[Convert]::ToBase64String($Bytes)

    $header = @{
        'Authorization' = "Basic $EncodedText"
        'Content-Type'  = "application/x-www-form-urlencoded; charset=utf-8"
        'Accept'        = "application/json"
    }
    $postParams = @{grant_type='client_credentials'}

    $authResponse = Invoke-RestMethod -Uri "https://auth.sbanken.no/IdentityServer/connect/token" -Method POST -Headers $header -Body $postParams

    New-Variable -Name 'SbankenAccessToken' -Scope 'Global' -Value "$authResponse.access_token" -Force
    New-Variable -Name 'SbankenUserId' -Scope 'Global' -Value $UserId
}