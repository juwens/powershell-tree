[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]
    $Path
)

function Out-Children {
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $FullPath,
        [Parameter(Mandatory=$false)]
        [string]
        $Prefix,
        [Parameter(Mandatory=$true)]
        [bool]
        $IsLastFolder
    )

    $items = (Get-ChildItem $FullPath)

    for ($i = 0; $i -lt $items.Count; $i++) {
        $item = $items[$i]
        $name = (Get-Item $item).Name
        $prefix = $Prefix
        $isLastItem = $i -eq ($items.Count - 1)

        $inifix = "+--"
        if ($isLastItem) {
            $inifix = "``--"
        }
        
        if (Test-Path -PathType Container $item) {
            Write-Host "$Prefix$inifix " -NoNewline
            Write-Host "$name" -ForegroundColor DarkCyan

            $childPrefix = "$Prefix" + ($isLastItem ? "    " : "|   ")
            Out-Children $item -Prefix $childPrefix -IsLastFolder $IsLastFolder
        } else {
            Write-Host "$prefix" -NoNewline
            Write-Host "$inifix" -NoNewline
            Write-Host " $name"  -NoNewline
            Write-Host " ($(Format-FileSize $item.length))"
        }
    }
}

Function Format-FileSize() {
    Param ([int64]$size)
    If     ($size -gt 1TB) {[string]::Format("{0:0.0} TB", $size / 1TB)}
    ElseIf ($size -gt 1GB) {[string]::Format("{0:0.0} GB", $size / 1GB)}
    ElseIf ($size -gt 1MB) {[string]::Format("{0:0.0} MB", $size / 1MB)}
    ElseIf ($size -gt 1KB) {[string]::Format("{0:0.0} kB", $size / 1KB)}
    ElseIf ($size -ge 0)   {[string]::Format("{0:0.0} B", $size)}
    Else                   {""}
}

$fullPath = Resolve-Path $Path

Write-Host "./$((Get-Item $fullPath).Name)"

Out-Children $fullPath -IsLastFolder $true
