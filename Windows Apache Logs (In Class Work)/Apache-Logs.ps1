function ApacheLogs($page, $code, $browser){
    $logEntries = Get-Content C:\xampp\apache\logs\access.log | Select-String  -Pattern "$($page) .* $($code) .* $($browser)"
    
    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    $ipsUnorganized = $regex.Matches($logEntries)

    $ips = @()
    for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
        $ips += [pscustomobject ]@{ "IP" = $ipsUnorganized[$i].value;}
    }

    $ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*"}
    $counts = $ipsoftens | Group-Object IP | Select-Object Count, Name
    return $counts
}
