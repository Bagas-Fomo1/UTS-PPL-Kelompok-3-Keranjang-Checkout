<#
.SYNOPSIS
    Script otomatis untuk membuat label GitHub Issues Kelompok 3 (CilacapTools).
.DESCRIPTION
    Script ini membaca file .github/labels.json dan membuat/memperbarui seluruh label
    pada repositori GitHub menggunakan GitHub REST API.
.PARAMETER RepoOwner
    Username atau Organisasi pemilik repositori (contoh: 'bagaspratama').
.PARAMETER RepoName
    Nama repositori GitHub (contoh: 'UTS-PPL-Kelompok-3-Keranjang-Checkout').
.PARAMETER Token
    GitHub Personal Access Token (classic atau fine-grained dengan izin 'issues:write').
.EXAMPLE
    .\setup_github_labels.ps1 -RepoOwner "username" -RepoName "UTS-PPL-Kelompok-3" -Token "ghp_xxxxxxxxxxxx"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string]$RepoOwner,

    [Parameter(Mandatory = $true)]
    [string]$RepoName,

    [Parameter(Mandatory = $true)]
    [string]$Token
)

$labelsPath = Join-Path -Path $PSScriptRoot -ChildPath "..\.github\labels.json"
if (-not (Test-Path $labelsPath)) {
    Write-Error "File labels.json tidak ditemukan pada: $labelsPath"
    exit 1
}

$labels = Get-Content $labelsPath -Raw | ConvertFrom-Json
$headers = @{
    "Authorization" = "Bearer $Token"
    "Accept"        = "application/vnd.github+json"
    "User-Agent"    = "PowerShell-LabelSetup-Kelompok3"
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Memulai Setup Label GitHub untuk $RepoOwner/$RepoName" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

foreach ($label in $labels) {
    $encodedName = [System.Uri]::EscapeDataString($label.name)
    $url = "https://api.github.com/repos/$RepoOwner/$RepoName/labels/$encodedName"
    $body = @{
        name        = $label.name
        color       = $label.color
        description = $label.description
    } | ConvertTo-Json

    try {
        # Cek apakah label sudah ada
        $check = Invoke-RestMethod -Uri $url -Headers $headers -Method Get -ErrorAction Stop
        # Update jika sudah ada
        $update = Invoke-RestMethod -Uri $url -Headers $headers -Method Patch -Body $body -ContentType "application/json"
        Write-Host " [UPDATED] $($label.name)" -ForegroundColor Yellow
    }
    catch {
        # Jika belum ada (404), buat baru
        $createUrl = "https://api.github.com/repos/$RepoOwner/$RepoName/labels"
        try {
            $created = Invoke-RestMethod -Uri $createUrl -Headers $headers -Method Post -Body $body -ContentType "application/json"
            Write-Host " [CREATED] $($label.name)" -ForegroundColor Green
        }
        catch {
            Write-Host " [FAILED] Gagal membuat $($label.name): $($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

Write-Host "`nSetup label selesai! Seluruh label standar telah siap digunakan di GitHub." -ForegroundColor Green
