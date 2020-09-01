function Invoke-SbankenAPI {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]
        $Uri,
        [Parameter(Position = 1)]
        [string]
        $Method = 'Get'
    )
    $header = @{
        "Accept" = "application/json"
        "customerId" = $userid
    }
    $authHeaders = @{}
    $authHeaders.Add("Accept", "application/json")
    $authHeaders.Add("customerId", $userid);
    $authHeaders.Add("Authorization", "Bearer "+$authResponse.access_token)
    $accountUri = "https://api.sbanken.no/exec.bank/api/v1/Accounts"
    $response = Invoke-RestMethod -Uri $accountUri -Method GET -Headers $authHeaders
    $response
    $response = Invoke-RestMethod -Uri $accountUri -Method GET -Headers $authHeaders
}