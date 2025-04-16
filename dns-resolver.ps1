param (
    [Parameter(Mandatory)]
    [string]$NetworkPrefix,

    [Parameter(Mandatory)]
    [string]$DNSServer
)

1..254 | ForEach-Object {
    $ip = "$NetworkPrefix.$_"

    try {
        $dns = Resolve-DnsName -Name $ip -Server $DNSServer -ErrorAction Stop
        Write-Host "Found: $ip → $($dns.NameHost)"
    } catch {
        # No output for unresolved IPs
    }
}
