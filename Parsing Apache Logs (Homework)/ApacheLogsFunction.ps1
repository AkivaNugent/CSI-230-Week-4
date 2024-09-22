function ApacheLogs() {
    $logsNotFormatted = Get-Content C:\xampp\apache\logs\access.log
    $tableRecords = @()

    for($i=0; $i -lt $logsNotFormatted.Count; $i++){
        $words = $logsNotFormatted[$i].-split(" ");

        $tableRecords += [pscustomobject]@{ "IP"  

    }

}