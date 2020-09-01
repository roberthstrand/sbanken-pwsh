function Get-SbankenAccounts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]
        $Uri
    )

    $authHeaders = @{}
    $authHeaders.Add("Accept", "application/json")
    $authHeaders.Add("customerId", $userid);
    $authHeaders.Add("Authorization", "Bearer "+$authResponse.access_token)
    $accountUri = "https://api.sbanken.no/exec.bank/api/v1/Accounts"
    $response = Invoke-RestMethod -Uri $accountUri -Method GET -Headers $authHeaders
    $response
}